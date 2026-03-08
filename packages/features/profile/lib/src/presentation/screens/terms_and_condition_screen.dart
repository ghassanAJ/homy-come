import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/data/model/res/terms_and_condition_model.dart';
import 'package:profile/src/di/di_container.dart';
import 'package:profile/src/presentation/cubit/terms_and_condition_cubit.dart';
import 'package:profile/src/presentation/widget/shared/about_app_shimmer.dart';
import 'package:util/util.dart' show BaseCubitStatus, BaseState;

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    final topContentPadding =
        MediaQuery.paddingOf(context).top + kToolbarHeight + UI.spacing.md;

    return UIScaffold(
      appBar: UIAppBar(
        title: context.profileTranslation.profile.term,
        leading: GestureDetector(
          onTap: ProfileInternalRouter.of(context).goBack,
          child: const BackButtonAppBar(),
        ),
      ),
      body: BlocProvider(
        create:
            (_) =>
                diContainer<TermsAndConditionCubit>()
                  ..fetchTermsAndCondition(),
        child: BlocBuilder<
          TermsAndConditionCubit,
          BaseState<TermsAndConditionModel>
        >(
          builder: (context, state) {
            final terms = state.data ?? const TermsAndConditionModel();
            final isInitialLoading =
                state.status == BaseCubitStatus.initial ||
                state.status == BaseCubitStatus.loading;

            return SingleChildScrollView(
              padding: UI.padding.profileInfoScreenContent(
                topInset: topContentPadding,
              ),
              child:
                  isInitialLoading && terms == const TermsAndConditionModel()
                      ? const Shimmer(child: AboutAppShimmer())
                      : UIText.bodyMedium(
                        terms.description,
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
