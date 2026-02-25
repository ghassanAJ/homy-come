import 'package:design_system/design_system.dart';

class ServiceOptionCard extends StatelessWidget {
  const ServiceOptionCard({
    super.key,
    required this.title,
    required this.duration,
    required this.description,
    required this.originalPrice,
    required this.discountedPrice,
    this.showAddButton = true,
    required this.onAddButtonPressed,
  });

  final String title;
  final String duration;
  final String description;
  final String originalPrice;
  final String discountedPrice;
  final bool showAddButton;
  final VoidCallback onAddButtonPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(UI.spacing.sm),
      decoration: BoxDecoration(
        color: UIColor.background,
        border: Border(bottom: BorderSide(color: UIColor.divider)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(UI.radius.sm),
            child: Container(
              width: 74,
              height: 74,
              color: UIColor.neutral100,
              child: Icon(
                Icons.handyman_outlined,
                color: UIColor.neutral500,
                size: UI.sizes.iconMd,
              ),
            ),
          ),
          SizedBox(width: UI.spacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIText.bodyMedium(
                  title,
                  fontWeight: FontWeight.w700,
                  color: UIColor.balck,
                ),
                SizedBox(height: UI.spacing.xxs),
                UIText.caption(duration, color: UIColor.textSecondary),
                SizedBox(height: UI.spacing.xxs),
                UIText.bodySmall(
                  '\u2022 $description',
                  color: UIColor.balck,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: UI.spacing.xxs),
                Row(
                  children: [
                    Text(
                      originalPrice,
                      style: UI.text.bodySmall.copyWith(
                        color: UIColor.textGray,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    SizedBox(width: UI.spacing.xs),
                    UIPriceText(
                      text: UIText.bodySmallBold(
                        originalPrice,
                        color: UIColor.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (showAddButton) ...[
            SizedBox(width: UI.spacing.sm),
            IconButton(
              hoverColor: UIColor.softGreen.withValues(alpha: 0.1),
              splashColor: UIColor.softGreen.withValues(alpha: 0.1),
              highlightColor: UIColor.softGreen.withValues(alpha: 0.1),
              onPressed: onAddButtonPressed,
              icon: Container(
                padding: EdgeInsets.all(UI.spacing.xs),
                decoration: BoxDecoration(
                  color: UIColor.softGreen,
                  borderRadius: BorderRadius.circular(UI.radius.lg),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: UI.spacing.xs),
                  child: UIText.bodySmall('Add'),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
