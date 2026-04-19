import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/data/model/res/review_model.dart';
import 'package:profile/src/di/di_container.dart';
import 'package:profile/src/presentation/cubit/provider_rating_and_reviews_cubit.dart';
import 'package:profile/src/presentation/widget/provider/rating_and_reviews_card.dart';
import 'package:profile/src/presentation/widget/provider/rating_and_reviews_card_shimmer.dart';
import 'package:profile/src/presentation/widget/shared/header_card.dart';
import 'package:profile/src/presentation/widget/shared/settings_section.dart';

class ProviderProfileScreen extends StatelessWidget {
  const ProviderProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerId = context.read<AppCubit>().state.userId ?? '';

    return UIScaffold(
      appBar: UIAppBar(title: context.profileTranslation.profile.myProfile),
      body: BlocProvider(
        create:
            (_) =>
                diContainer<ProviderRatingAndReviewsCubit>()
                  ..fetchProviderRatingAndReviews(providerId: providerId),
        child: BlocBuilder<
          ProviderRatingAndReviewsCubit,
          BaseState<List<ReviewModel>>
        >(
          builder: (context, state) {
            final reviews = state.data ?? const <ReviewModel>[];
            final ratingDistribution = _buildRatingDistributionForView(context);
            final isInitialLoading =
                state.status == BaseCubitStatus.initial ||
                state.status == BaseCubitStatus.loading;

            return SingleChildScrollView(
              child: Padding(
                padding: UI.padding.driverProfileContent(topInset: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeaderCard(showRating: true, rating: 5.0),
                    SizedBox(height: UI.spacing.sm),
                    if (isInitialLoading && reviews.isEmpty)
                      const RatingAndReviewsCardShimmer()
                    else
                      RatingAndReviewsCard(
                        ratingDistribution: ratingDistribution,
                        reviews: reviews,
                      ),
                    SizedBox(height: UI.spacing.sm),
                    SettingsSection(
                      onTap:
                          ProfileInternalRouter.of(
                            context,
                          ).toDriverProfileSettings,
                      title: context.profileTranslation.driverProfile.settings,
                    ),
                    SizedBox(height: 120),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  List<RatingDistributionUiModel> _buildRatingDistributionForView(
    BuildContext context,
  ) {
    final reviewsTranslation = context.profileTranslation.reviews;

    return [
      RatingDistributionUiModel(
        label: reviewsTranslation.excellent,
        color: UIColor.successDark,
        ratio: 0.88,
      ),
      RatingDistributionUiModel(
        label: reviewsTranslation.good,
        color: UIColor.aqua,
        ratio: 0.65,
      ),
      RatingDistributionUiModel(
        label: reviewsTranslation.average,
        color: UIColor.orange,
        ratio: 0.42,
      ),
      RatingDistributionUiModel(
        label: reviewsTranslation.belowAverage,
        color: UIColor.warningStrong,
        ratio: 0.30,
      ),
      RatingDistributionUiModel(
        label: reviewsTranslation.poor,
        color: UIColor.errorStrong,
        ratio: 0.06,
      ),
    ];
  }
}
