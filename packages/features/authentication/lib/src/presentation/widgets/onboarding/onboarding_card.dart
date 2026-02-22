import 'package:design_system/design_system.dart';
import 'package:design_system/gen/assets.gen.dart';

class MDOnboardingCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final double height;
  final String subtitle;
  const MDOnboardingCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.height,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: UI.spacing.xxl + UI.spacing.xs,
          ),
          child: AspectRatio(
            aspectRatio: 331 / 278,
            child: SizedBox(
              width: double.infinity,
              child: AssetGenImage(
                imagePath,
              ).image(package: 'design_system', fit: BoxFit.cover),
            ),
          ),
        ),

        SizedBox(height: UI.spacing.xxl2),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: UI.spacing.xl),
          child: UIText.h2(
            title,
            textAlign: TextAlign.center,
            color: UIColor.black,
          ),
        ),
        SizedBox(height: UI.spacing.md),
        Padding(
          padding: EdgeInsetsDirectional.only(
            start: UI.spacing.xxl + UI.spacing.xxs,
            end: UI.spacing.xxl2 + UI.spacing.xxs,
          ),
          child: UIText.bodyMedium(
            subtitle,
            textAlign: TextAlign.center,
            color: UIColor.textSecondary,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
