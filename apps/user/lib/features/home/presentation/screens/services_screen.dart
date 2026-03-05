import 'package:booking/booking.dart';
import 'package:go_router/go_router.dart';
import 'package:user/features/home/presentation/bloc/home_bloc.dart';
import 'package:user/features/home/presentation/bloc/home_bloc_event.dart';
import 'package:user/features/home/presentation/bloc/home_bloc_state.dart';
import 'package:user/features/home/presentation/widgets/home/service_offer_tile.dart';
import 'package:user/features/home/presentation/widgets/shared/categories_search_field.dart';
import 'package:user/navigation/route.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({required this.id, super.key});
  final int id;
  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  final TextEditingController _searchController = TextEditingController();
  final String _selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(
      LoadCategoryServicesEvent(widget.id.toString()),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomSafeArea = MediaQuery.of(context).padding.bottom;

    return UIScaffold(
      backgroundColor: UIColor.background,
      appBarTitle: 'All Services',
      // appBar: SectionHeaderAppBar(title: 'All Services'),
      body: BlocBuilder<HomeBloc, HomeBlocState>(
        builder: (context, state) {
          if (state.status == HomeBlocStatus.loadingServiceDetails) {
            return const ServicesScreenShimmar();
          }
          if (state.error != null) {
            return Center(
              child: Text(
                state.error?.message ?? '',
                style: TextStyle(color: UIColor.error),
              ),
            );
          }

          final displayedPreviews = state.categoryServices;

          return ListView(
            padding: UI.padding
                .userSearchBottomSectionContent(
                  bottomInset: 110 + bottomSafeArea,
                )
                .copyWith(top: UI.spacing.md),
            children: [
              CategoriesSearchField(
                controller: _searchController,
                placeholder: 'Hinted search text',
              ),
              // SizedBox(height: UI.spacing.lg),
              // SizedBox(
              //   height: 40,
              //   child: ListView.separated(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: chipLabels.length,
              //     separatorBuilder: (_, __) => SizedBox(width: UI.spacing.sm),
              //     itemBuilder: (_, index) {
              //       final label = chipLabels[index];
              //       return UIChipWidget(
              //         title: label,
              //         isSelected: _selectedCategory == label,
              //         onTap: () => setState(() => _selectedCategory = label),
              //       );
              //     },
              //   ),
              // ),
              SizedBox(height: UI.spacing.md),
              ...displayedPreviews.asMap().entries.map(
                (entry) => Padding(
                  padding: EdgeInsetsDirectional.only(
                    bottom:
                        entry.key == displayedPreviews.length - 1
                            ? 0
                            : UI.spacing.lg,
                  ),
                  child: GestureDetector(
                    onTap:
                        () => context.push(
                          UserPaths.serviceDetails,
                          extra: {'id': entry.value.id},
                        ),

                    child: ServiceOfferTile(
                      servicePreviewResponseModel: entry.value,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ServiceDetailsScreenShimmar extends StatelessWidget {
  const ServiceDetailsScreenShimmar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UI.padding.allMd,
      child: ListView(
        children: [
          ShimmerBox(width: 10, height: 200, radius: 10),
          SizedBox(height: UI.spacing.md),
          ShimmerBox(width: 10, height: 200, radius: 10),
          SizedBox(height: UI.spacing.md),
          ShimmerBox(width: 10, height: 200, radius: 10),
          SizedBox(height: UI.spacing.md),
          ShimmerBox(width: 10, height: 200, radius: 10),
        ],
      ),
    );
  }
}

class ServicesScreenShimmar extends StatelessWidget {
  const ServicesScreenShimmar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UI.padding.allMd,
      child: ListView(
        children: [
          ShimmerBox(width: 10, height: 200, radius: 10),
          SizedBox(height: UI.spacing.md),
          ShimmerBox(width: 10, height: 200, radius: 10),
          SizedBox(height: UI.spacing.md),
          ShimmerBox(width: 10, height: 200, radius: 10),
          SizedBox(height: UI.spacing.md),
          ShimmerBox(width: 10, height: 200, radius: 10),
        ],
      ),
    );
  }
}
