import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/data/model/res/review_model.dart';
import 'package:profile/src/domain/repository/profile_repository.dart';
import 'package:profile/src/navigation/router.dart';
import 'package:profile/src/presentation/cubit/provider_rating_and_reviews_cubit.dart';
import 'package:profile/src/presentation/widget/provider/rating_and_reviews_card.dart';
import 'package:profile/src/presentation/widget/shared/header_card.dart';
import 'package:profile/src/presentation/widget/shared/settings_row.dart';
import 'package:util/util.dart' show BaseCubitStatus, BaseState;

class ProviderProfileScreen extends StatefulWidget {
  const ProviderProfileScreen({super.key});

  @override
  State<ProviderProfileScreen> createState() => _ProviderProfileScreenState();
}

class _ProviderProfileScreenState extends State<ProviderProfileScreen> {
  static const List<_RatingDistributionUiConfig> _ratingDistributionUiConfig = [
    _RatingDistributionUiConfig(
      label: 'Excellent',
      color: UIColor.successDark,
      ratio: 0.88,
    ),
    _RatingDistributionUiConfig(
      label: 'Good',
      color: UIColor.aqua,
      ratio: 0.65,
    ),
    _RatingDistributionUiConfig(
      label: 'Average',
      color: UIColor.orange,
      ratio: 0.42,
    ),
    _RatingDistributionUiConfig(
      label: 'Below Average',
      color: UIColor.warningStrong,
      ratio: 0.30,
    ),
    _RatingDistributionUiConfig(
      label: 'Poor',
      color: UIColor.errorStrong,
      ratio: 0.06,
    ),
  ];

  late final ProfileRepository _repository = GetIt.I<ProfileRepository>();
  late final ProviderRatingAndReviewsCubit _cubit =
      ProviderRatingAndReviewsCubit(_repository)
    ..fetchProviderRatingAndReviews();

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topContentPadding =
        MediaQuery.paddingOf(context).top + kToolbarHeight + UI.spacing.md;

    return UIScaffold(
      appBar: UIAppBar(title: context.profileTranslation.profile.myProfile),
      body: BlocProvider.value(
        value: _cubit,
        child: BlocBuilder<
          ProviderRatingAndReviewsCubit,
          BaseState<List<ReviewModel>>
        >(
          builder: (context, state) {
            final reviews = state.data ?? const <ReviewModel>[];
            final ratingDistribution = _buildRatingDistributionForView();
            final isInitialLoading =
                state.status == BaseCubitStatus.initial ||
                state.status == BaseCubitStatus.loading;

            return SingleChildScrollView(
              child: Padding(
                padding: UI.padding.driverProfileContent(
                  topInset: topContentPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeaderCard(showRating: true, rating: 5.0),
                    SizedBox(height: UI.spacing.sm),
                    if (isInitialLoading && reviews.isEmpty)
                      _buildLoadingCard()
                    else
                      RatingAndReviewsCard(
                        ratingDistribution: ratingDistribution,
                        reviews: reviews,
                      ),
                    SizedBox(height: UI.spacing.sm),
                    Container(
                      width: double.infinity,
                      padding: UI.padding.driverProfileSettingsCardContent,
                      decoration: BoxDecoration(
                        color: UIColor.background,
                        borderRadius: BorderRadius.circular(UI.radius.md),
                        boxShadow: UI.shadows.cardMd,
                      ),
                      child: SettingsRow(
                        onTap:
                            () => context.push(
                              ProfilePaths.driverProfileSettings,
                            ),
                        title:
                            context.profileTranslation.driverProfile.settings,
                        titleBuilder:
                            (title, color) => UIText.bodySmall(
                              title,
                              color: color,
                              fontWeight: FontWeight.w600,
                            ),
                        showDivider: false,
                      ),
                    ),
                    SizedBox(height: UI.sizes.bottomNavigationBarHeight),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLoadingCard() {
    return Container(
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
        color: UIColor.background,
        borderRadius: BorderRadius.circular(UI.radius.md),
        boxShadow: UI.shadows.cardMd,
      ),
      child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
    );
  }

  List<RatingDistributionUiModel> _buildRatingDistributionForView() {
    return _ratingDistributionUiConfig
        .map(
          (config) => RatingDistributionUiModel(
            label: config.label,
            color: config.color,
            ratio: config.ratio.clamp(0.0, 1.0).toDouble(),
          ),
        )
        .toList(growable: false);
  }
}

class _RatingDistributionUiConfig {
  const _RatingDistributionUiConfig({
    required this.label,
    required this.color,
    required this.ratio,
  });

  final String label;
  final UIColor color;
  final double ratio;
}
