
import 'package:design_system/design_system.dart';

class MemberInfoShimmer extends StatelessWidget {
  const MemberInfoShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: ShimmerBox(
          width: UI.sizes.avatarLg,
          height: UI.sizes.avatarLg,
          radius: 0,
          shape: BoxShape.circle,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerBox(width: 140, height: UI.spacing.md, radius: 6),
            SizedBox(height: UI.spacing.xxs),
            ShimmerBox(width: 80, height:UI.spacing.sm, radius: 4),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ShimmerBox(width: UI.spacing.xxl, height: UI.spacing.lg, radius: 9),
          ],
        ),
      ),
    );
  }
}
