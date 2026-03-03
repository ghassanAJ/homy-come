import 'package:booking/booking.dart';
import 'package:design_system/design_system.dart';

class AddOnCard extends StatelessWidget {
  const AddOnCard({
    super.key,
    required this.data,
    required this.onAddButtonPressed,
  });

  final AddOnServiceModel data;

  final VoidCallback onAddButtonPressed;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
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
                    data.info.name ?? '',
                    fontWeight: FontWeight.w700,
                    color: UIColor.balck,
                  ),
                  SizedBox(height: UI.spacing.xxs),
                  UIText.caption(
                    data.durationMinutes.toString() ?? '',
                    color: UIColor.textSecondary,
                  ),
                  SizedBox(height: UI.spacing.xxs),
                  UIText.bodySmall(
                    '\u2022 ${data.info.description ?? ''}',
                    color: UIColor.balck,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: UI.spacing.xxs),
                  Row(
                    children: [
                      Text(
                        data.price.currentPrice.toString() ?? '',
                        style: UI.text.bodySmall.copyWith(
                          color: UIColor.textGray,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: UI.spacing.xs),
                      UIPriceText(
                        text: UIText.bodySmallBold(
                          data.price.newPrice.toString() ?? '',
                          color: UIColor.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (true) ...[
              SizedBox(width: UI.spacing.sm),
              IconButton(
                hoverColor: UIColor.babyBlue.withValues(alpha: 0.1),
                splashColor: UIColor.babyBlue.withValues(alpha: 0.1),
                highlightColor: UIColor.babyBlue.withValues(alpha: 0.1),
                onPressed: onAddButtonPressed,
                icon: Container(
                  padding: EdgeInsets.all(UI.spacing.xs),
                  decoration: BoxDecoration(
                    color: UIColor.babyBlue,
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
      ),
    );
  }
}
