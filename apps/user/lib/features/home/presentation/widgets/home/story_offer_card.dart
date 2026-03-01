import 'package:design_system/design_system.dart';

class StoryOfferCard extends StatelessWidget {
  const StoryOfferCard({
    required this.title,
    required this.discount,
    required this.description,
    required this.background,
    required this.backgroundContainer,
    required this.iconPath,
    super.key,
  });

  final String title;
  final String discount;
  final String description;
  final Color background;
  final Color backgroundContainer;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 124,
      padding: UI.padding.userHomeStoryOfferCardContent,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(UI.radius.md),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UIIconBackground(
            size: 28,
            iconSize: 18,
            backgroundColor: UIColor.white.withValues(alpha: 0.2),
            child: UISvg(iconPath),
          ),
          SizedBox(height: UI.spacing.xxs),
          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: UI.text.bodyXXSmall.copyWith(
              color: UIColor.graphite,
              fontWeight: FontWeight.w500,
              fontSize: 10,
              height: 18 / 10,
              letterSpacing: -0.4,
              fontFamily: 'Montserrat',
            ),
          ),
          UIText.bodyMedium(
            discount,
            color: UIColor.white,
            fontWeight: FontWeight.w700,
            maxLines: 1,
          ),
          SizedBox(height: UI.spacing.xs),
          Container(
            decoration: BoxDecoration(
              color: UIColor.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(UI.radius.md - UI.radius.xs),
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              child: Text(
                description.toUpperCase(),
                style: UI.text.bodyXXSmall.copyWith(
                  color: backgroundContainer,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
