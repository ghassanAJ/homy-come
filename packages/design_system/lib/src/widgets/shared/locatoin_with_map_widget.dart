import 'package:design_system/design_system.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationWithMapWidget extends StatelessWidget {
  const LocationWithMapWidget({super.key, required this.address});
  final String address;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UIText.bodyXSmall('Address', color: UIColor.grey),
        SizedBox(height: UI.spacing.xxs),
        UIText.bodySmall(
          address,
          color: UIColor.black,
          overflow: TextOverflow.clip,
        ),
        SizedBox(height: UI.spacing.sm),
        ClipRRect(
          borderRadius: BorderRadius.circular(UI.radius.md),
          child: SizedBox(
            height: 80,
            width: double.infinity,
            child: GoogleMap(
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              zoomGesturesEnabled: false,
              scrollGesturesEnabled: false,
              rotateGesturesEnabled: false,
              tiltGesturesEnabled: false,
              compassEnabled: false,
              initialCameraPosition: CameraPosition(target: LatLng(33.5, 44.2)),
            ),
          ),
        ),
      ],
    );
  }
}
