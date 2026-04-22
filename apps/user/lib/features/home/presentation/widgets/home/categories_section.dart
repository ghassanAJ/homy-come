import 'package:booking/booking.dart';
import 'package:user/features/home/presentation/bloc/home_bloc.dart';
import 'package:user/features/home/presentation/bloc/home_bloc_state.dart';
import 'package:user/features/home/presentation/widgets/home/home_content_lists.dart';
import 'package:user/features/home/presentation/widgets/home/home_section.dart';
import 'package:user/localization/files/userTranslation.i69n.dart';
import 'package:util/util.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = context.loc<UserTranslation>();
    return BlocBuilder<HomeBloc, HomeBlocState>(
      buildWhen:
          (previous, current) => previous.categories != current.categories,
      builder: (context, state) {
        final categories = state.categories;
        if (categories.isEmpty) {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }
        return HomeSection(
          title: tr.home.category,
          titleBottomSpacing: UI.spacing.md,
          sectionBottomSpacing: 24,
          child: HomeCategoriesRow(items: categories),
        );
      },
    );
  }
}
