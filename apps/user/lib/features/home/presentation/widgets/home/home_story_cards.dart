import 'dart:developer';

import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';
import 'package:user/features/home/data/model/res/home_response_model.dart';
import 'package:user/features/home/presentation/screens/stories_screen.dart';
import 'package:user/features/home/presentation/widgets/home/story_offer_card.dart';
import 'package:user/navigation/route.dart';

class HomeStoryCards extends StatelessWidget {
  const HomeStoryCards({required this.stories, super.key});

  final List<OfferModel> stories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.zero,
      itemCount: stories.length,
      itemBuilder: (context, index) {
        final item = stories[index];
        return Padding(
          padding: UI.padding.userHomeItemStartAndEnd(isFirst: index == 0),
          child: GestureDetector(
            onTap: () {
              _goToStoryDetails(context, index);
            },
            child: StoryOfferCard(imageUrl: item.imageUrl ?? ''),
          ),
        );
      },
    );
  }

  void _goToStoryDetails(BuildContext context, int index) {
    context.push(
      UserPaths.storiesScreen,
      extra: {'pageIndex': index, 'storyItems': getPages()},
    );
  }

  List<StoryPageData> getPages() {
    final List<StoryPageData> pages =
        stories.map((story) => StoryPageData(stories: [story])).toList();

    log('pages ${pages[0].stories.first}');

    return pages;
  }
}
