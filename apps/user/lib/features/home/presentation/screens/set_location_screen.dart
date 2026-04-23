// ignore_for_file: prefer_final_fields

import 'dart:async';

import 'package:authentication/authentication.dart';
import 'package:booking/booking.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:user/features/home/presentation/widgets/home/user_home_screen_app_bar.dart';
import 'package:util/util.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key, required this.selectedLocation});

  final UserddressModel selectedLocation;

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  final Completer<GoogleMapController> _mapController = Completer();
  final TextEditingController _searchController = TextEditingController();

  LatLng? _selectedLatLng;
  Marker? _marker;

  String? _addressTitle;
  String? _addressSubtitle;

  bool _isLoadingLocation = false;

  @override
  void initState() {
    super.initState();
    _initializeLocation();
  }

  Future<void> _initializeLocation() async {
    final hasInitialLocation =
        widget.selectedLocation.latitude != null &&
        widget.selectedLocation.longitude != null;

    if (hasInitialLocation) {
      _updateLocation(
        LatLng(
          widget.selectedLocation.latitude!,
          widget.selectedLocation.longitude!,
        ),
      );
      return;
    }

    final current = await _getCurrentLatLng();
    if (current != null) {
      _updateLocation(current);
    }
  }

  Future<LatLng?> _getCurrentLatLng() async {
    _setLoading(true);

    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _showError('Please enable location services');
      _setLoading(false);
      return null;
    }

    var permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      _showError('Location permission denied');
      _setLoading(false);
      return null;
    }

    final position = await Geolocator.getCurrentPosition();
    _setLoading(false);

    return LatLng(position.latitude, position.longitude);
  }

  Future<void> _moveToCurrentLocation() async {
    final latLng = await _getCurrentLatLng();
    if (latLng == null) return;

    _updateLocation(latLng);
    _animateCamera(latLng);
  }

  void _updateLocation(LatLng latLng) {
    setState(() {
      _selectedLatLng = latLng;
      _marker = Marker(
        markerId: const MarkerId('selected_location'),
        position: latLng,
      );
    });

    _resolveAddress(latLng);
  }

  Future<void> _resolveAddress(LatLng latLng) async {
    try {
      final placemarks = await placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );

      if (placemarks.isEmpty) return;

      final place = placemarks.first;

      if (!mounted) return;
      setState(() {
        _addressTitle = '${place.street ?? ''} ${place.name ?? ''}';
        _addressSubtitle =
            '${place.locality ?? ''}, ${place.administrativeArea ?? ''}, ${place.country ?? ''}';
      });
    } catch (e) {
      print('e is $e');
      if (!mounted) return;
      setState(() {
        _addressTitle = '';
        _addressSubtitle = '';
      });
    }
  }

  Future<void> _animateCamera(LatLng latLng) async {
    final controller = await _mapController.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(latLng, 16));
  }

  void _confirmLocation() {
    if (_selectedLatLng == null) return;

    context.read<AuthUserBloc>().add(
      UpdateProfile(
        context.read<AppCubit>().state.user!.copyWith(
          latitude: _selectedLatLng!.latitude,
          longitude: _selectedLatLng!.longitude,
          address: _addressTitle ?? '',
        ),
      ),
    );

    // Navigator.pop(
    //   context,
    //   UserddressModel(
    //     latitude: _selectedLatLng!.latitude,
    //     longitude: _selectedLatLng!.longitude,
    //     addressTitle: _addressTitle ?? '',
    //   ),
    // );
  }

  void _showError(String message) {
    ToastificationUtil.error(message);
  }

  void _setLoading(bool value) {
    if (mounted) {
      setState(() => _isLoadingLocation = value);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_selectedLatLng == null) {
      return const Center(child: CircularProgressIndicator.adaptive());
    }

    return UIScaffold(
      appBar: const UIAppBar(title: 'Confirm delivery location'),
      bottomSheet: _BottomSheet(
        addressTitle: _addressTitle,
        addressSubtitle: _addressSubtitle,
        onConfirm: _selectedLatLng == null ? null : _confirmLocation,
      ),
      body: Stack(
        children: [
          _MapView(
            initialPosition: _selectedLatLng!,
            marker: _marker,
            onMapCreated: _mapController.complete,
            onTap: _updateLocation,
          ),

          _SearchBox(
            controller: _searchController,
            isLoading: _isLoadingLocation,
            onUseCurrentLocation: _moveToCurrentLocation,
            onSearchItemClicked: (prediction) {
              _searchController.text = prediction.description!;
            },
            onPlaceSelected: (latLng) async {
              _updateLocation(latLng);
              _animateCamera(latLng);
            },
          ),
        ],
      ),
    );
  }
}

// ==============================
// Widgets
// ==============================

class _MapView extends StatelessWidget {
  const _MapView({
    required this.initialPosition,
    required this.onMapCreated,
    required this.onTap,
    this.marker,
  });

  final LatLng initialPosition;
  final Marker? marker;
  final ValueChanged<GoogleMapController> onMapCreated;
  final ValueChanged<LatLng> onTap;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: initialPosition, zoom: 14),
      onMapCreated: onMapCreated,
      markers: marker != null ? {marker!} : {},
      onTap: onTap,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
    );
  }
}

class _SearchBox extends StatelessWidget {
  const _SearchBox({
    required this.controller,
    required this.isLoading,
    required this.onUseCurrentLocation,
    required this.onPlaceSelected,
    required this.onSearchItemClicked,
  });

  final TextEditingController controller;
  final bool isLoading;
  final VoidCallback onUseCurrentLocation;
  final ValueChanged<LatLng> onPlaceSelected;
  final ValueChanged<Prediction> onSearchItemClicked;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            textEditingController: controller,
            itemClick: onSearchItemClicked,
            googleAPIKey: 'AIzaSyDpxlMAhVScyZ1itTc1g5Q4tdCKNOaHQP4',
            isLatLngRequired: true,
            debounceTime: 600,
            inputDecoration: _buildInputDecoration(),

            getPlaceDetailWithLatLng: (prediction) {
              final lat = double.parse(prediction.lat!);
              final lng = double.parse(prediction.lng!);

              onPlaceSelected(LatLng(lat, lng));
            },
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
          ),

          const SizedBox(height: 4),
          Container(
            color: UIColor.neutral200,
            height: 1,
            width: double.infinity,
          ),
          const SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GestureDetector(
              onTap: isLoading ? null : onUseCurrentLocation,
              child: Row(
                children: [
                  isLoading
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
}

class _BottomSheet extends StatelessWidget {
  const _BottomSheet({
    required this.addressTitle,
    required this.addressSubtitle,
    required this.onConfirm,
  });

  final String? addressTitle;
  final String? addressSubtitle;
  final VoidCallback? onConfirm;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
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
            _AddressInfo(title: addressTitle, subtitle: addressSubtitle),
            const SizedBox(height: 24),

            BlocConsumer<AuthUserBloc, AuthUserState>(
              listener: (context, state) {
                if (state is AuthUserStateAuthenticated) {
                  context.pop();
                  ToastificationUtil.success('Address updated');
                }
              },
              builder: (contex, state) {
                return UIButton.primary(
                  expanded: true,
                  isLoading: state is AuthUserStateLoading,
                  label: 'Confirm address',
                  onPressed: onConfirm,
                );
              },
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  bool isNotSelected() {
    return (addressTitle?.isEmpty ?? true) ||
        (addressSubtitle?.isEmpty ?? true);
  }
}

class _AddressInfo extends StatelessWidget {
  const _AddressInfo({this.title, this.subtitle});

  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return isNotSelected()
        ? SizedBox.shrink()
        : Row(
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
                  if (subtitle != null)
                    UIText.bodySmall(subtitle!, fontWeight: FontWeight.w600),
                  UIText.captionSmall(
                    title?.isNotEmpty == true ? title! : 'Select location',
                  ),
                ],
              ),
            ),
          ],
        );
  }

  bool isNotSelected() {
    return (title?.isEmpty ?? true) || (subtitle?.isEmpty ?? true);
  }
}
