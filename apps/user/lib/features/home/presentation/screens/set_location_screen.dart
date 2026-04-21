// ignore_for_file: unused_field, prefer_final_fields

import 'dart:async';
import 'dart:developer';

import 'package:design_system/design_system.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:user/features/home/presentation/widgets/home/user_home_screen_app_bar.dart';
import 'package:util/util.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key, required this.selectedLocation});

  final LatLng selectedLocation;

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  late LatLng _selectedLocation; // default
  Marker? _marker;
  String? _addressTitle;
  String? _addressSubtitle;
  bool _loadingLocation = false;
  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _selectedLocation = widget.selectedLocation;
    _setMarker(_selectedLocation);
    log('PLACES_KEY :${dotenv.get('PLACES_KEY', fallback: 'empty')}');
  }

  void _setMarker(LatLng position) {
    setState(() {
      _selectedLocation = position;
      _marker = Marker(
        markerId: const MarkerId('selected_location'),
        position: position,
      );
    });

    _updateAddressFromLatLng(position);
  }

  Future<void> _goToCurrentLocation() async {
    setState(() => _loadingLocation = true);

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() => _loadingLocation = false);
      _showMessage('Please enable location services');
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      setState(() => _loadingLocation = false);
      _showMessage('Location permission denied');
      return;
    }

    final position = await Geolocator.getCurrentPosition();
    final latLng = LatLng(position.latitude, position.longitude);

    _setMarker(latLng);

    final controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(latLng, 16));

    setState(() => _loadingLocation = false);
  }

  void _showMessage(String msg) {
    ToastificationUtil.error(msg);
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  void _confirmLocation() {
    Navigator.pop(
      context,
      UserddressModel(
        latitude: _selectedLocation.latitude,
        longitude: _selectedLocation.longitude,
        addressTitle: _addressTitle ?? '',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UIScaffold(
      bottomSheet: _buildBottomSheet(),
      appBar: UIAppBar(
        title: 'Confirm delivery location',

        // backgroundColor: UIColor.primary,
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _selectedLocation,
              zoom: 14,
            ),
            onMapCreated: (controller) {
              _controller.complete(controller);
            },
            markers: _marker != null ? {_marker!} : {},
            onTap: _setMarker,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
          ),

          /// زر current location
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: UIColor.white,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GooglePlaceAutoCompleteTextField(
                  showError: false,
                  seperatedBuilder: Container(
                    height: 1,
                    width: double.infinity,
                    color: UIColor.neutral200,
                  ),
                  itemBuilder:
                      (context, index, prediction) => Container(
                        padding: EdgeInsets.all(16),
                        color: Colors.white,

                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UISvg(
                              Assets.icons.location,
                              color: UIColor.babyBlue,
                              size: 20,
                            ),
                            SizedBox(width: 5),
                            Expanded(
                              child: UIText.bodySmall(
                                prediction.description ?? '',
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ),

                  boxDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  textEditingController: _searchController,
                  googleAPIKey: 'AIzaSyDpxlMAhVScyZ1itTc1g5Q4tdCKNOaHQP4',
                  inputDecoration: _buildInputDecoration(),
                  debounceTime: 600,
                  isLatLngRequired: true,
                  getPlaceDetailWithLatLng: (prediction) async {
                    final lat = double.parse(prediction.lat!);
                    final lng = double.parse(prediction.lng!);

                    final latLng = LatLng(lat, lng);

                    _setMarker(latLng);
                    _updateAddressFromLatLng(latLng);

                    final controller = await _controller.future;
                    controller.animateCamera(
                      CameraUpdate.newLatLngZoom(latLng, 16),
                    );
                  },
                  itemClick: (prediction) {
                    _searchController.text = prediction.description!;
                  },
                ),

                const SizedBox(height: 8),
                Container(
                  color: UIColor.neutral200,
                  height: 1,
                  width: double.infinity,
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GestureDetector(
                    onTap: _loadingLocation ? null : _goToCurrentLocation,
                    child: Row(
                      children: [
                        _loadingLocation
                            ? CircularProgressIndicator.adaptive()
                            : UISvg(Assets.icons.location),
                        const SizedBox(width: 12),
                        UIText.bodySmall(
                          'Use my current location',
                          // color: UIColor.primary,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      // filled: true,
      fillColor: UIColor.white,
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      hintText: 'Search by city or zip code',
      hintStyle: UI.text.bodySmall.copyWith(color: UIColor.neutral400),
      prefixIcon: Padding(
        padding: const EdgeInsetsDirectional.only(end: 8, start: 16),
        child: UISvg(Assets.icons.navSearch),
      ),
      prefixIconConstraints: BoxConstraints(minWidth: 24, minHeight: 24),
    );
  }

  Container _buildBottomSheet() {
    return Container(
      decoration: BoxDecoration(
        color: UIColor.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Color(0xffD1D5DC),
                borderRadius: BorderRadius.circular(UI.radius.lg),
              ),

              height: 4,
              width: 40,
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: UIColor.background,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: UIColor.softgrey,
                      shape: BoxShape.circle,
                    ),
                    child: UISvg(Assets.icons.location),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (_addressSubtitle != null)
                          UIText.bodySmall(
                            _addressSubtitle!,
                            textAlign: TextAlign.start,
                          ),

                        UIText.captionSmall(
                          _addressTitle == null || _addressTitle!.isEmpty
                              ? 'Select location'
                              : _addressTitle!,
                          maxLines: 1,
                          color: UIColor.neutral500,

                          textAlign: TextAlign.start,
                        ),

                        // UIText.captionSmall(
                        //   '123 Main St, Anytown, USA',
                        //   color: UIColor.neutral500,
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 9),

            UIButton.primary(
              expanded: true,
              label: 'Confirm address',
              onPressed: _confirmLocation,
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Future<void> _updateAddressFromLatLng(LatLng latLng) async {
    try {
      final placemarks = await placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;

        setState(() {
          _addressTitle = '${place.street ?? ''} ${place.name ?? ''}';
          _addressSubtitle =
              '${place.locality ?? ''}, ${place.administrativeArea ?? ''}, ${place.country ?? ''}';
        });
      }
    } catch (e) {
      _addressTitle = 'Selected location';
      _addressSubtitle = '';
    }
  }
}
