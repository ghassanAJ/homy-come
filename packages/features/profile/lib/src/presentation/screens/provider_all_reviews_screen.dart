import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';
import 'package:profile/src/data/model/res/review_model.dart';
import 'package:profile/src/presentation/widget/provider/review_item.dart';

class ProviderAllReviewsScreen extends StatelessWidget {
  const ProviderAllReviewsScreen({super.key, required this.reviews});

  final List<ReviewModel> reviews;

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
      body:
          reviews.isEmpty
              ? Padding(
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
              )
              : ListView.builder(
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
              ),
    );
  }
}
