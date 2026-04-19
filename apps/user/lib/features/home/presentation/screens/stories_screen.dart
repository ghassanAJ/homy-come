import 'package:booking/booking.dart';
import 'package:user/features/home/presentation/screens/story_view.dart';

class StoryPageData {
  StoryPageData({required this.stories});
  final List<Widget> stories;
}

class StoriesScreen extends StatelessWidget {
  const StoriesScreen({super.key, this.pageIndex = 0, required this.pages});
  final int pageIndex;
  final List<StoryPageData> pages;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColor.background,
      // extendBody: true,
      // extendBodyBehindAppBar: true,
      body: StoryPageView1(
        indicatorPadding: EdgeInsetsGeometry.symmetric(vertical: 70),
        gestureItemBuilder: (context, pageIndex, storyIndex, _) {
          return Column(
            children: [
              // GestureDetector(
              //   // child: storyItems[pageIndex].stories[storyIndex],
              //   onVerticalDragEnd: (details) {
              //     Navigator.of(context).pop();
              //   },
              // ),
            ],
          );
        },
        backgroundColor: UIColor.background,
        indicatorUnvisitedColor: UIColor.border,
        indicatorVisitedColor: UIColor.white,
        initialStoryIndex: (pageIndex) => pageIndex,
        itemBuilder: (context, pageIndex, storyIndex, _) {
          return pages[pageIndex].stories[storyIndex];
        },
        storyLength: (pageIndex) => pages[pageIndex].stories.length,
        pageLength: pages.length,
        indicatorsCount: (int pageIndex) {
          return pages[pageIndex].stories.length;
        },
      ),
    );
  }
}
