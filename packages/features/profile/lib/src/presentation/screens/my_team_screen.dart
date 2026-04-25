import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/data/model/res/myTeam_member_model.dart';
import 'package:profile/src/di/di_container.dart';
import 'package:profile/src/presentation/cubit/myTeam_cubit.dart';
import 'package:profile/src/presentation/widget/member_info_widget.dart';
import 'package:profile/src/presentation/widget/shared/loading_fetch_my_team.dart';
import 'package:profile/src/presentation/widget/shared/no_found_my_team_widget.dart';
import 'package:util/util.dart';

class MyTeamScreen extends StatelessWidget {
  const MyTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileLocalizationScope(
      child: BlocProvider(
        create: (context) => diContainer<MyteamCubit>()..getMyTeamData(),
        child: Builder(
          builder: (context) {
            final tr = context.profileTranslation;

            return RefreshIndicator(
              onRefresh: () async {
                BlocProvider.of<MyteamCubit>(context).getMyTeamData();
              },
              child: UIScaffold(
                appBar: UIAppBar(title: tr.profile.memberTeam),
                body: Padding(
                  padding: EdgeInsets.fromLTRB(
                    UI.spacing.xl,
                    12,
                    UI.spacing.xl,
                    0,
                  ),
                  child: CustomScrollView(
                    slivers: [
                      BlocBuilder<
                        MyteamCubit,
                        BaseState<List<MyteamMemberModel>>
                      >(
                        builder: (context, state) {
                          if (state.status == BaseCubitStatus.loading) {
                            return LoadingFetchMyTeamData();
                          } else if (state.error != null) {
                            return SliverToBoxAdapter(
                              child: UIText.bodySmall(state.error!.message),
                            );
                          }
                          if (state.data == null &&
                              state.data?.isEmpty == true) {
                            return NoFoundMyteamDataWidget();
                          }
                          return SliverList.separated(
                            itemBuilder:
                                (context, index) =>
                                    MemeberInfoWidget(item: state.data![index]),
                            separatorBuilder:
                                (context, _) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8.0,
                                  ),
                                  child: Divider(),
                                ),
                            itemCount: state.data!.length,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                appBarTitle: tr.profile.myTeam,
              ),
            );
          },
        ),
      ),
    );
  }
}
