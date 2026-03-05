import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:profile/src/data/model/res/review_model.dart';
import 'package:profile/src/domain/repository/profile_repository.dart';
import 'package:profile/src/presentation/cubit/provider_rating_and_reviews_cubit.dart';
import 'package:profile/src/presentation/widget/provider/review_item.dart';
import 'package:profile/src/presentation/widget/provider/review_item_shimmer.dart';

class ProviderAllReviewsScreen extends StatefulWidget {
  const ProviderAllReviewsScreen({super.key});

  @override
  State<ProviderAllReviewsScreen> createState() => _ProviderAllReviewsScreenState();
}

class _ProviderAllReviewsScreenState extends State<ProviderAllReviewsScreen> {
  late final ProfileRepository _repository = GetIt.I<ProfileRepository>();
  late final ProviderRatingAndReviewsCubit _cubit;

  @override
  void initState() {
    super.initState();
    final providerId = context.read<AppCubit>().state.userId ?? '';
    _cubit = ProviderRatingAndReviewsCubit(_repository)
      ..fetchProviderRatingAndReviews(providerId: providerId);
  }

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
      appBar: UIAppBar(
        title: 'Reviews',
        leading: GestureDetector(
          onTap: () {
            if (context.canPop()) context.pop();
          },
          child: const BackButtonAppBar(),
        ),
      ),
      body: BlocProvider.value(
        value: _cubit,
        child: BlocBuilder<ProviderRatingAndReviewsCubit, BaseState<List<ReviewModel>>>(
          builder: (context, state) {
            final reviews = state.data ?? const <ReviewModel>[];
            final isInitialLoading =
                state.status == BaseCubitStatus.initial ||
                state.status == BaseCubitStatus.loading;

            if (isInitialLoading && reviews.isEmpty) {
              return Shimmer(
                child: ListView.builder(
                  padding: EdgeInsets.only(
                    top: topContentPadding,
                    left: UI.spacing.lg,
                    right: UI.spacing.lg,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return ReviewItemShimmer(
                      showDivider: index < 3,
                    );
                  },
                ),
              );
            }

            if (reviews.isEmpty) {
              return Padding(
                padding: UI.padding.driverProfileContent(
                  topInset: topContentPadding,
                ),
                child: Center(
                  child: UIText.bodySmall(
                    'No reviews yet',
                    color: UIColor.neutral480,
                    fontFamily: UIFontFamily.roboto,
                  ),
                ),
              );
            }

            return ListView.builder(
              padding: EdgeInsets.only(
                top: topContentPadding,
                left: UI.spacing.lg,
                right: UI.spacing.lg,
              ),
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
