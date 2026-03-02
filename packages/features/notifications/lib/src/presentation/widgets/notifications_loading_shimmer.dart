import 'package:design_system/design_system.dart';
import 'package:util/util.dart';

class NotificationsLoadingShimmer extends StatelessWidget {
  const NotificationsLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    const sectionItemCounts = [2, 3];

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      padding: UI.padding.notificationsContent,
      child: Shimmer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _buildShimmerSections(sectionItemCounts),
        ),
      ),
    );
  }

  List<Widget> _buildShimmerSections(List<int> sectionItemCounts) {
    return ListWidgetBuilder.mapWithIsLast(sectionItemCounts, (
      itemCount,
      sectionIndex,
      isLastSection,
    ) {
      return Padding(
        padding: UI.padding.notificationsSectionSpacing(isLast: isLastSection),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerBox(
              width: _sectionTitleWidth(sectionIndex),
              height: UI.spacing.sm,
              radius: UI.radius.xs,
            ),
            SizedBox(height: UI.spacing.xs),
            ..._buildShimmerNotificationItems(itemCount),
          ],
        ),
      );
    });
  }

  List<Widget> _buildShimmerNotificationItems(int itemCount) {
    final placeholders = List<int>.generate(itemCount, (index) => index);

    return ListWidgetBuilder.mapWithIsLast(placeholders, (
      _,
      itemIndex,
      isLastItem,
    ) {
      return Padding(
        padding: UI.padding.notificationsItemSpacing(isLast: isLastItem),
        child: _buildShimmerNotificationCard(itemIndex),
      );
    });
  }

  Widget _buildShimmerNotificationCard(int itemIndex) {
    final isHighlighted = itemIndex % 3 == 0;
    return Container(
      width: double.infinity,
      height: UI.spacing.xxxl * 2,
      padding: UI.padding.notificationsShimmerCardContent,
      decoration: BoxDecoration(
        color:
            isHighlighted
                ? UIColor.softGreen.withValues(alpha: 0.32)
                : Colors.transparent,
        borderRadius: BorderRadius.circular(UI.radius.xs),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerBox(
            width: UI.spacing.md,
            height: UI.spacing.md,
            radius: UI.radius.full,
            color: isHighlighted ? UIColor.neutral850 : UIColor.neutral450,
          ),
          SizedBox(width: UI.spacing.xs),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerBox(
                  width: UI.spacing.xxl * 3,
                  height: UI.spacing.md + UI.spacing.xxs,
                  radius: UI.radius.xs,
                ),
                SizedBox(height: UI.spacing.xs),
                ShimmerBox(
                  width: UI.spacing.xxl * 6,
                  height: UI.spacing.sm,
                  radius: UI.radius.xs,
                ),
                SizedBox(height: UI.spacing.xxs),
                ShimmerBox(
                  width: UI.spacing.xxl * 5,
                  height: UI.spacing.sm,
                  radius: UI.radius.xs,
                ),
                SizedBox(height: UI.spacing.md),
                ShimmerBox(
                  width: UI.spacing.xxl2 * 2,
                  height: UI.spacing.sm,
                  radius: UI.radius.xs,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  double _sectionTitleWidth(int index) {
    const widths = [56.0, 84.0, 72.0];
    return widths[index % widths.length];
  }
}
