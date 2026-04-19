import 'package:design_system/design_system.dart';
import 'package:profile/src/presentation/widget/shared/member_info_shimmer.dart';

class LoadingFetchMyTeamData extends StatelessWidget {
  const LoadingFetchMyTeamData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, i) => MemberInfoShimmer(),
      separatorBuilder:
          (context, _) => SizedBox(height: UI.spacing.md),
      itemCount: 5,
    );
  }
}
