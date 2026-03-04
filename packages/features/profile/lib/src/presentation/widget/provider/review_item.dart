import 'package:design_system/design_system.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({
    super.key,
    required this.name,
    required this.timeAgo,
    required this.comment,
    required this.rating,
    required this.showDivider,
  });

  final String name;
  final String timeAgo;
  final String comment;
  final double rating;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: UI.spacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildReviewAvatar(),
              SizedBox(width: UI.spacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: UIText.bodySmall(
                            name,
                            color: UIColor.black,
                            fontWeight: FontWeight.w700,
                            fontFamily: UIFontFamily.sFPro,
                          ),
                        ),
                        UIText.bodySmall(
                          timeAgo,
                          color: UIColor.neutral300,
                          fontWeight: FontWeight.w300,
                          fontFamily: UIFontFamily.roboto,
                        ),
                      ],
                    ),
                    SizedBox(height: UI.spacing.xxs),
                    Row(
                      children: [
                        UIRatingStars(rating: rating, color: UIColor.orange),
                        SizedBox(width: UI.spacing.xs),
                        UIText.bodySmall(
                          rating.toStringAsFixed(1),
                          color: UIColor.neutral975,
                          fontWeight: FontWeight.w700,
                          fontFamily: UIFontFamily.roboto,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: UI.spacing.xs),
          UIText.bodyXSmall(
            comment,
            color: UIColor.neutral480,
            fontFamily: UIFontFamily.roboto,
          ),
          if (showDivider) ...[
            SizedBox(height: UI.spacing.sm),
            Divider(color: UIColor.neutral100, thickness: 1),
          ],
        ],
      ),
    );
  }

  Widget _buildReviewAvatar() {
    return Avatar(
      showName: false,
      size: AvatarSize.medium,
      placeholderWidget: Container(
        color: UIColor.neutral100,
        alignment: Alignment.center,
        child: Icon(Icons.person, color: UIColor.neutral400),
      ),
    );
  }
}
