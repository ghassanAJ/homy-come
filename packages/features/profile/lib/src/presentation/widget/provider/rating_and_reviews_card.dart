import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';
import 'package:profile/src/data/model/res/review_model.dart';
import 'package:profile/src/navigation/router.dart';
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

class RatingAndReviewsCard extends StatelessWidget {
  const RatingAndReviewsCard({
    super.key,
    required this.ratingDistribution,
    required this.reviews,
  });

  final List<RatingDistributionUiModel> ratingDistribution;
  final List<ReviewModel> reviews;

  @override
  Widget build(BuildContext context) {
    final visibleReviews =
        reviews.take(2).toList(growable: false);

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
            ...ratingDistribution.map(_buildRatingDistributionRow),
            SizedBox(height: UI.spacing.md),
            Divider(color: UIColor.neutral100, thickness: 2),
            SizedBox(height: UI.spacing.md),
            ...List.generate(
              visibleReviews.length,
              (index) => ReviewItem(
                review: visibleReviews[index],
                showDivider: index < visibleReviews.length - 1,
              ),
            ),
            if (reviews.length > 2) ...[
              SizedBox(height: UI.spacing.xs),
              Center(
                child: InkWell(
                  borderRadius: BorderRadius.circular(UI.radius.md),
                  onTap:
                      () => context.push(
                        ProfilePaths.providerAllReviews,
                        extra: <String, dynamic>{
                          ProfilePaths.reviews: reviews,
                        },
                      ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: UI.spacing.sm,
                      vertical: UI.spacing.xxs,
                    ),
                    child: UIText.bodyXSmall(
                      'Show more',
                      color: UIColor.successDark,
                      fontWeight: FontWeight.w700,
                      fontFamily: UIFontFamily.roboto,
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
