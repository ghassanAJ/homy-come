import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/data/model/res/review_model.dart';
import 'package:profile/src/di/di_container.dart';
import 'package:profile/src/presentation/cubit/provider_rating_and_reviews_cubit.dart';
import 'package:profile/src/presentation/widget/provider/review_item.dart';
import 'package:profile/src/presentation/widget/provider/reviews_shimmer.dart';

class ProviderAllReviewsScreen extends StatelessWidget {
  const ProviderAllReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerId = context.read<AppCubit>().state.userId ?? '';

    return UIScaffold(
      appBar: UIAppBar(title: context.profileTranslation.reviews.title),
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
            final isInitialLoading =
                state.status == BaseCubitStatus.initial ||
                state.status == BaseCubitStatus.loading;

            if (isInitialLoading) {
              return ReviewsShimmer(topInset: 12);
            }

            if (reviews.isEmpty) {
              return Padding(
                padding: UI.padding.driverProfileContent(topInset: 12),
                child: Center(
                  child: UIText.bodySmall(
                    context.profileTranslation.reviews.empty,
                    color: UIColor.neutral480,
                    fontFamily: UIFontFamily.roboto,
                  ),
                ),
              );
            }

            return ListView.builder(
              padding: UI.padding.profileAllReviewsContent(topInset: 12),
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                return ReviewItem(
                  review: reviews[index],
                  showDivider: index < reviews.length - 1,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
