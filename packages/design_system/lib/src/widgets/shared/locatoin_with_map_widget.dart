import 'package:design_system/design_system.dart';

class LocationWithMapWidget extends StatelessWidget {
  const LocationWithMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UIText.bodyXSmall('Address', color: UIColor.grey),
        SizedBox(height: UI.spacing.xxs),
        UIText.bodySmall(
          'UEA Location name , details locations , street name 12357',
          color: UIColor.black,
          overflow: TextOverflow.clip,
        ),
        SizedBox(height: UI.spacing.sm),
        ClipRRect(
          borderRadius: BorderRadius.circular(UI.radius.md),
          child: Container(
            height: 54,
            width: double.infinity,
            color: UIColor.neutral100,
            alignment: Alignment.center,
          ),
        ),
      ],
    );
  }
}
