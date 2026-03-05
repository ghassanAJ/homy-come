import 'package:design_system/design_system.dart';

class ReviewItemShimmer extends StatelessWidget {
  const ReviewItemShimmer({super.key, required this.showDivider});

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
              ShimmerBox(
                width: UI.sizes.avatarMd,
                height: UI.sizes.avatarMd,
                radius: UI.radius.full,
                shape: BoxShape.circle,
              ),
              SizedBox(width: UI.spacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShimmerBox(
                          width: UI.spacing.xxxl + UI.spacing.md,
                          height: UI.spacing.md,
                          radius: UI.radius.xs,
                        ),
                        SizedBox(width: UI.spacing.sm),
                        ShimmerBox(
                          width: UI.spacing.xl + UI.spacing.sm,
                          height: UI.spacing.sm,
                          radius: UI.radius.xs,
                        ),
                      ],
                    ),
                    SizedBox(height: UI.spacing.xxs),
                    Row(
                      children: [
                        Row(
                          children: List.generate(
                            5,
                            (index) => Padding(
                              padding: EdgeInsets.only(right: UI.spacing.xxs),
                              child: ShimmerBox(
                                width: UI.spacing.sm,
                                height: UI.spacing.sm,
                                radius: UI.radius.xs,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: UI.spacing.sm),
                        ShimmerBox(
                          width: UI.spacing.lg,
                          height: UI.spacing.sm,
                          radius: UI.radius.xs,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: UI.spacing.xs),
          ShimmerBox(
            width: double.infinity,
            height: UI.spacing.sm,
            radius: UI.radius.xs,
          ),
          SizedBox(height: UI.spacing.xxs),
          ShimmerBox(
            width: UI.spacing.xxl * 4,
            height: UI.spacing.sm,
            radius: UI.radius.xs,
          ),
          if (showDivider) ...[
            SizedBox(height: UI.spacing.sm),
            Divider(color: UIColor.neutral100, thickness: 1),
          ],
        ],
      ),
    );
  }
}
