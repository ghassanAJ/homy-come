import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/src/data/model/res/about_app_model.dart';
import 'package:profile/src/di/di_container.dart';
import 'package:profile/src/presentation/cubit/about_app_cubit.dart';
import 'package:profile/src/presentation/widget/shared/about_app_shimmer.dart';
import 'package:util/util.dart' show BaseCubitStatus, BaseState;

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return UIScaffold(
      appBar: UIAppBar(title: title),
      body: BlocProvider(
        create: (_) => diContainer<AboutAppCubit>()..fetchAboutApp(),
        child: BlocBuilder<AboutAppCubit, BaseState<AboutAppModel>>(
          builder: (context, state) {
            final aboutApp = state.data ?? const AboutAppModel();
            final isInitialLoading =
                state.status == BaseCubitStatus.initial ||
                state.status == BaseCubitStatus.loading;

            return SingleChildScrollView(
              padding: UI.padding.profileInfoScreenContent(topInset: 12),
              child:
                  isInitialLoading && aboutApp == const AboutAppModel()
                      ? const Shimmer(child: AboutAppShimmer())
                      : UIText.bodyMedium(
                        aboutApp.description,
                        color: UIColor.textNatral600,
                        fontWeight: FontWeight.w500,
                      ),
            );
          },
        ),
      ),
    );
  }
}
