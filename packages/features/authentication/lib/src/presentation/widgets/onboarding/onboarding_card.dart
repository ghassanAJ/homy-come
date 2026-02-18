import 'package:design_system/design_system.dart';
import 'package:design_system/gen/assets.gen.dart';

class MDOnboardingCard extends StatelessWidget {
  final AssetGenImage image;
  final String title;
  final double height;
  final String subtitle;
  const MDOnboardingCard({
    super.key,
    required this.image,
    required this.title,
    required this.height,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        image.image(
          package: 'design_system',
          width: 331,
          height: 278,
          fit: BoxFit.contain,
        ),

        const SizedBox(height: 40),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: UI.spacing.xl),
          child: UIText.h2(
            title,
            textAlign: TextAlign.center,
            color: UIColor.black,
          ),
        ),
        SizedBox(height: UI.spacing.md),
        Padding(
          padding: const EdgeInsets.only(left: 53, right: 44),
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
