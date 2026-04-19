import 'package:design_system/design_system.dart';
import 'package:profile/src/presentation/widget/provider/reviews_shimmer.dart';

class RatingAndReviewsCardShimmer extends StatelessWidget {
  const RatingAndReviewsCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: UIColor.background,
        borderRadius: BorderRadius.circular(UI.radius.md),
        boxShadow: UI.shadows.cardMd,
      ),
      child: Shimmer(
        child: Padding(
          padding: UI.padding.driverProfilePerformanceCardContent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...List.generate(5, (_) => _buildRatingDistributionRow()),
              SizedBox(height: UI.spacing.md),
              Divider(color: UIColor.neutral100, thickness: 2),
              SizedBox(height: UI.spacing.md),
              const ReviewItemShimmer(showDivider: true),
              const ReviewItemShimmer(showDivider: false),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRatingDistributionRow() {
    return Padding(
      padding: UI.padding.profileRatingAndReviewsRowSpacing,
      child: Row(
        children: [
          ShimmerBox(
            width: UI.spacing.xxxl + UI.spacing.xxl,
            height: UI.spacing.md,
            radius: UI.radius.xs,
          ),
          SizedBox(width: UI.spacing.xs),
          Expanded(
            child: ShimmerBox(
              width: double.infinity,
              height: UI.spacing.xs,
              radius: UI.radius.xs,
            ),
          ),
        ],
      ),
    );
  }
}
