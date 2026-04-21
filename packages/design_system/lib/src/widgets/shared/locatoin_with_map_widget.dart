import 'package:design_system/design_system.dart';

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
          child: UIImage(
            Assets.images.locationImage.path,
            height: 72,
            wigth: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
