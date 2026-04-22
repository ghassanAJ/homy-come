import 'package:booking/booking.dart';
import 'package:go_router/go_router.dart';
import 'package:user/features/home/data/model/res/home_response_model.dart';
import 'package:user/features/home/presentation/screens/story_view.dart';
import 'package:user/navigation/route.dart';
import 'package:util/util.dart' as ToastificationUtil;

class StoryPageData {
  StoryPageData({required this.stories});
  final List<OfferModel> stories;
}

class StoriesScreen extends StatelessWidget {
  const StoriesScreen({super.key, this.pageIndex = 0, required this.pages});
  final int pageIndex;
  final List<StoryPageData> pages;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColor.grey,
      // extendBody: true,
      // extendBodyBehindAppBar: true,
      body: StoryPageView1(
        indicatorPadding: EdgeInsetsGeometry.symmetric(vertical: 70),
        gestureItemBuilder: (context, pageIndex, storyIndex, _) {
          return Column(
            children: [
              Expanded(
                child: GestureDetector(
                  // child: storyItems[pageIndex].stories[storyIndex],
                  onVerticalDragEnd: (details) {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: ApplyOfferLabelWidget(
                  onApplyOffer: () {
                    context.push(
                      UserPaths.serviceDetails,
                      extra: {
                        'id':
                            pages[pageIndex].stories[storyIndex].service?.id
                                .toString(),
                        "discountCode":
                            pages[pageIndex].stories[storyIndex].discountCode,
                        "discountPercentage":
                            pages[pageIndex]
                                .stories[storyIndex]
                                .discountPercentage,
                      },
                    );
                    ToastificationUtil.success('Your voucher code is applied!');
                  },
                ),
              ),
            ],
          );
        },
        initialPage: pageIndex,
        backgroundColor: UIColor.grey,
        indicatorUnvisitedColor: UIColor.border,
        indicatorVisitedColor: UIColor.black,
        // initialStoryIndex: (_) => pageIndex,
        itemBuilder: (context, pageIndex, storyIndex, _) {
          return UINetworkImage(
            imageUrl: pages[pageIndex].stories[storyIndex].imageUrl,
          );
        },
        storyLength: (pageIndex) => 1, //pages[pageIndex].stories.length
        pageLength: pages.length,
        indicatorsCount: (int pageIndex) {
          return 1; // pages[pageIndex].stories.length;
        },
      ),
    );
  }
}

class ApplyOfferLabelWidget extends StatelessWidget {
  const ApplyOfferLabelWidget({super.key, this.onApplyOffer});
  final void Function()? onApplyOffer;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 24),

      decoration: BoxDecoration(
        color: UIColor.babyPink,
        border: Border.all(color: UIColor.pink),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.discount_outlined),
          SizedBox(width: 8),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon(Icons),
              UIText.bodyBold('65% Off'),
              UIText.bodySmall('Code: 65CLEAN'),
            ],
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              onApplyOffer?.call();
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: UIColor.pink,
            ),
            child: UIText.bodySmall(
              'Apply',
              color: UIColor.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
