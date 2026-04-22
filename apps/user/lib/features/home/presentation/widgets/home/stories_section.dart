import 'package:booking/booking.dart';
import 'package:user/features/home/presentation/bloc/home_bloc.dart';
import 'package:user/features/home/presentation/bloc/home_bloc_state.dart';
import 'package:user/features/home/presentation/widgets/home/home_section.dart';
import 'package:user/features/home/presentation/widgets/home/home_story_cards.dart';
import 'package:user/localization/files/userTranslation.i69n.dart';
import 'package:util/util.dart';

class StoriesSection extends StatelessWidget {
  const StoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = context.loc<UserTranslation>();
    return BlocBuilder<HomeBloc, HomeBlocState>(
      buildWhen: (previous, current) => previous.stories != current.stories,
      builder: (context, state) {
        final offers = state.stories;
        if (offers.isEmpty) {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }
        return HomeSection(
          title: tr.home.storiesOffers,
          sectionBottomSpacing: UI.spacing.lg,
          child: SizedBox(
            height: 145,
            child: HomeStoryCards(stories: state.stories),
          ),
        );
      },
    );
  }
}
