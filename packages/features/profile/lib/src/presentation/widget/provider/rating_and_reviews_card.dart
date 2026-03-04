import 'package:design_system/design_system.dart';
import 'package:profile/src/data/model/res/review_model.dart';
import 'package:profile/src/presentation/widget/provider/review_item.dart';

class RatingDistributionUiModel {
  const RatingDistributionUiModel({
    required this.label,
    required this.color,
    required this.ratio,
  });

  final String label;
  final UIColor color;
  final double ratio;
}

class RatingAndReviewsCard extends StatefulWidget {
  const RatingAndReviewsCard({
    super.key,
    required this.ratingDistribution,
    required this.reviews,
  });

  final List<RatingDistributionUiModel> ratingDistribution;
  final List<ReviewModel> reviews;

  @override
  State<RatingAndReviewsCard> createState() => _RatingAndReviewsCardState();
}

class _RatingAndReviewsCardState extends State<RatingAndReviewsCard> {
  bool _showAllReviews = false;

  @override
  Widget build(BuildContext context) {
    final visibleReviews =
        _showAllReviews
            ? widget.reviews
            : widget.reviews.take(2).toList(growable: false);

    return Container(
      decoration: BoxDecoration(
        color: UIColor.background,
        borderRadius: BorderRadius.circular(UI.radius.md),
        boxShadow: UI.shadows.cardMd,
      ),
      child: Padding(
        padding: UI.padding.driverProfilePerformanceCardContent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...widget.ratingDistribution.map(_buildRatingDistributionRow),
            SizedBox(height: UI.spacing.md),
            Divider(color: UIColor.neutral100, thickness: 2),
            SizedBox(height: UI.spacing.md),
            ...List.generate(
              visibleReviews.length,
              (index) => ReviewItem(
                name: visibleReviews[index].name,
                timeAgo: visibleReviews[index].timeAgo,
                comment: visibleReviews[index].comment,
                rating: visibleReviews[index].rating,
                showDivider: index < visibleReviews.length - 1,
              ),
            ),
            if (widget.reviews.length > 2) ...[
              SizedBox(height: UI.spacing.xs),
              Center(
                child: InkWell(
                  borderRadius: BorderRadius.circular(UI.radius.md),
                  onTap: () {
                    setState(() {
                      _showAllReviews = !_showAllReviews;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: UI.spacing.sm,
                      vertical: UI.spacing.xxs,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        UIText.bodyXSmall(
                          _showAllReviews ? 'Show less' : 'Show more',
                          color: UIColor.successDark,
                          fontWeight: FontWeight.w700,
                          fontFamily: UIFontFamily.roboto,
                        ),
                        SizedBox(width: UI.spacing.lg),
                        Transform.rotate(
                          angle: _showAllReviews ? 3.14159 : 0,
                          child: UISvg(
                            Assets.icons.arrowBottom,
                            color: UIColor.successDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildRatingDistributionRow(RatingDistributionUiModel item) {
    return Padding(
      padding: EdgeInsets.only(bottom: UI.spacing.md),
      child: Row(
        children: [
          SizedBox(
            width: UI.spacing.xxxl+UI.spacing.xxl,
            child: UIText.bodySmall(
              item.label,
              color: UIColor.neutral480,
              fontFamily: UIFontFamily.roboto,
            ),
          ),
          SizedBox(width: UI.spacing.xs),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(UI.radius.xs),
              child: SizedBox(
                height: UI.spacing.xs,
                child: Stack(
                  children: [
                    Container(color: UIColor.softgrey),
                    FractionallySizedBox(
                      widthFactor: item.ratio,
                      child: Container(
                        decoration: BoxDecoration(
                          color: item.color,
                          borderRadius: BorderRadius.circular(UI.radius.xs),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
