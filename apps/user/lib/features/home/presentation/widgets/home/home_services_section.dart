import 'package:booking/booking.dart';
import 'package:user/features/home/presentation/bloc/home_bloc.dart';
import 'package:user/features/home/presentation/bloc/home_bloc_state.dart';
import 'package:user/features/home/presentation/widgets/home/home_content_lists.dart';
import 'package:user/features/home/presentation/widgets/home/home_section.dart';

class HomeServicesSection extends StatelessWidget {
  const HomeServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeBlocState>(
      // buildWhen:
      //     (previous, current) => previous.categories != current.categories,
      builder: (context, state) {
        final categories = state.categories;
        if (categories.isEmpty) {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }
        if (state.categoriesLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator.adaptive()),
          );
        }
        return SliverMainAxisGroup(
          slivers: List.generate(
            categories.length,
            (index) =>
                state.categories[index].services.isNotEmpty
                    ? HomeSection(
                      title: categories[index].info.name,
                      sectionBottomSpacing: UI.spacing.xl,
                      child: SizedBox(
                        height: 158,
                        child: HomeServiceCards(
                          servicePreviews: state.categories[index].services,
                        ),
                      ),
                    )
                    : const SliverToBoxAdapter(child: SizedBox.shrink()),
          ),
        );
      },
    );
  }
}
