import 'package:design_system/design_system.dart';
import 'package:flutter/widgets.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/presentation/widget/member_info_widget.dart';

class MyTeamScreen extends StatelessWidget {
  const MyTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final topContentPadding =
        MediaQuery.paddingOf(context).top + kToolbarHeight + UI.spacing.md;
    final tr = context.profileTranslation;
    return UIScaffold(
      withBackgroundGradient: true,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          UI.spacing.xl,
          topContentPadding,
          UI.spacing.xl,
          0,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  UIText.h4(tr.profile.memberTeam),
                  SizedBox(height: UI.spacing.xl),
                ],
              ),
            ),
            SliverList.separated(
              itemBuilder: (context, index) => MemeberInfoWidget(),
              separatorBuilder: (context, _) => SizedBox(height: UI.spacing.lg),
              itemCount: 15,
            ),
          ],
        ),
      ),
      appBarTitle: tr.profile.myTeam,
    );
  }
}
