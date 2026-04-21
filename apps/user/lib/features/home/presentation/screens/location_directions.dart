// ignore_for_file: unused_field, prefer_final_fields

import 'dart:async';

import 'package:design_system/design_system.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationDirectionsScreen extends StatefulWidget {
  const LocationDirectionsScreen({
    super.key,
    this.selectedLocation,
    required this.address,
  });

  final LatLng? selectedLocation;
  final String address;

  @override
  State<LocationDirectionsScreen> createState() =>
      _LocationDirectionsScreenState();
}

class _LocationDirectionsScreenState extends State<LocationDirectionsScreen> {
  PolylinePoints polylinePoints = PolylinePoints(
    apiKey: 'AIzaSyDuiA_nrffI4GL6Ss2_mTmwXHXiDpMc1mE',
  );
  List<LatLng> polylineCoordinates = [];

  void getPolyline() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      // : "YOUR_API_KEY",
      request: PolylineRequest(
        origin: PointLatLng(37.7749, -122.4194),
        destination: PointLatLng(37.3382, -121.8863),
        mode: TravelMode.driving,
      ),
    );
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }
    setState(() {}); // Refresh UI with the new polyline
  }

  @override
  void initState() {
    super.initState();
    getPolyline();
  }

  Set<Marker> _markers = {
    Marker(
      markerId: MarkerId('source'),
      position: LatLng(37.7749, -122.4194), // San Francisco
      infoWindow: InfoWindow(title: 'Source'),
    ),
    Marker(
      markerId: MarkerId('destination'),
      position: LatLng(37.3382, -121.8863), // San Jose
      infoWindow: InfoWindow(title: 'Destination'),
    ),
  };
  final Completer<GoogleMapController> _controller = Completer();

  late LatLng _selectedLocation; // default
  Marker? _marker;
  String? _addressTitle;
  String? _addressSubtitle;
  bool _loadingLocation = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return UIScaffold(
      appBar: UIAppBar(
        title: 'Directions',

        // backgroundColor: UIColor.primary,
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(37.7749, -122.4194),
          zoom: 10,
        ),
        markers: _markers,
        polylines: {
          Polyline(
            polylineId: PolylineId("route"),
            color: UIColor.black,
            points: polylineCoordinates,
            width: 5,
          ),
        },
      ),
      bottomSheet: _buildBottomSheet(),
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
                        UIText.captionSmall(
                          'Address',
                          maxLines: 1,
                          color: UIColor.neutral500,

                          textAlign: TextAlign.start,
                        ),
                        UIText.bodySmall(
                          widget.address,
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
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
