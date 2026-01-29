import 'package:design_system/design_system.dart';

class MDOnboardingCard extends StatelessWidget {
  final String image;
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.check, size: 40),
        // Image.asset(image, height: height / 1.75),
        const SizedBox(height: 32),
        UIText.h2(title, textAlign: TextAlign.center),
        const SizedBox(height: 4),
        UIText.bodyMedium(
          subtitle,
          textAlign: TextAlign.center,
          color: UIColor.textSecondary,
        ),
      ],
    );
  }
}
