import 'package:authentication/authentication.dart';
import 'package:booking/booking.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/di/di_container.dart';
import 'package:user/features/booking/presentation/cubit/service_details_cubit.dart';
import 'package:user/features/booking/presentation/widgets/service_option_card.dart';

class ServiceDetailsScreen extends StatefulWidget {
  const ServiceDetailsScreen({super.key});

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
  late final ServiceDetailsCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = ServiceDetailsCubit(diContainer.get<BookingRepository>());
    _cubit.fetchServiceDetails(serviceId: 'home-deep-cleaning');
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topContentPadding =
        MediaQuery.paddingOf(context).top + kToolbarHeight + UI.spacing.sm;

    return UIScaffold(
      appBarTitle: 'Home Deep Cleaning',
      body: BlocProvider.value(
        value: _cubit,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: topContentPadding),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(UI.radius.md),
                child: Container(
                  width: double.infinity,
                  height: 72,
                  color: UIColor.neutral100,
                  child: UISvg(
                    Assets.icons.calendar,
                    color: UIColor.primaryDark,
                  ),
                ),
              ),
            ),
            SizedBox(height: UI.spacing.sm),
            UIText.h4('Home Cleaning', color: UIColor.balck),
            SizedBox(height: UI.spacing.sm),
            BlocBuilder<
              ServiceDetailsCubit,
              BaseState<ServiceDetailsResponseModel>
            >(
              builder: (context, state) {
                if (state.status == BaseCubitStatus.loading) {
                  return UIProgressIndicator();
                }
                if (state.status == BaseCubitStatus.error) {
                  return Center(
                    child: UIText.bodyMedium(state.error?.message ?? ''),
                  );
                }
                return Expanded(
                  child: CategoryTabSectionView<ServiceOptionCard>(
                    tabChanged: (index) {
                      print('tabChanged: $index');
                    },
                    // tabBuilder:
                    //     (context, title, isActive) => ServiceCategoryChip(
                    //       label: title,
                    //       selected: isActive,
                    //       onTap: () {},
                    //     ),
                    sections:
                        state.data!.sections
                            .map(
                              (section) => CategorySection<ServiceOptionCard>(
                                id: section.title, // TODO: add id
                                title: section.title,
                                items: _buildServiceOptions(section.options),
                              ),
                            )
                            .toList(),

                    //  [
                    //   CategorySection(
                    //     id: '1',
                    //     title: 'Home Cleaning',
                    //     items: [
                    //       ServiceOptionCard(
                    //         title: 'Home Cleaning',
                    //         duration: '60 min',
                    //         description:
                    //             'Reliable Door lock installation & repair for improved home safety & function',
                    //         originalPrice: '100',
                    //         discountedPrice: '80',
                    //       ),
                    //       ServiceOptionCard(
                    //         title: 'Home Cleaning',
                    //         duration: '60 min',
                    //         description:
                    //             'Reliable Door lock installation & repair for improved home safety & function',
                    //         originalPrice: '100',
                    //         discountedPrice: '80',
                    //       ),
                    //       ServiceOptionCard(
                    //         title: 'Home Cleaning',
                    //         duration: '60 min',
                    //         description:
                    //             'Reliable Door lock installation & repair for improved home safety & function',
                    //         originalPrice: '100',
                    //         discountedPrice: '80',
                    //       ),
                    //       ServiceOptionCard(
                    //         title: 'Home Cleaning',
                    //         duration: '60 min',
                    //         description:
                    //             'Reliable Door lock installation & repair for improved home safety & function',
                    //         originalPrice: '100',
                    //         discountedPrice: '80',
                    //       ),
                    //       ServiceOptionCard(
                    //         title: 'Home Cleaning',
                    //         duration: '60 min',
                    //         description:
                    //             'Reliable Door lock installation & repair for improved home safety & function',
                    //         originalPrice: '100',
                    //         discountedPrice: '80',
                    //       ),
                    //       ServiceOptionCard(
                    //         title: 'Home Cleaning',
                    //         duration: '60 min',
                    //         description:
                    //             'Reliable Door lock installation & repair for improved home safety & function',
                    //         originalPrice: '100',
                    //         discountedPrice: '80',
                    //       ),
                    //     ],
                    //   ),
                    //   CategorySection(
                    //     id: '2',
                    //     title: 'Furniture Cleaning',
                    //     items: [
                    //       ServiceOptionCard(
                    //         title: 'Furniture Cleaning',
                    //         duration: '60 min',
                    //         description: 'Furniture Cleaning',
                    //         originalPrice: '100',
                    //         discountedPrice: '80',
                    //       ),
                    //       ServiceOptionCard(
                    //         title: 'Furniture Cleaning',
                    //         duration: '60 min',
                    //         description: 'Furniture Cleaning',
                    //         originalPrice: '100',
                    //         discountedPrice: '80',
                    //       ),
                    //       ServiceOptionCard(
                    //         title: 'Furniture Cleaning',
                    //         duration: '60 min',
                    //         description: 'Furniture Cleaning',
                    //         originalPrice: '100',
                    //         discountedPrice: '80',
                    //       ),
                    //       ServiceOptionCard(
                    //         title: 'Furniture Cleaning',
                    //         duration: '60 min',
                    //         description: 'Furniture Cleaning',
                    //         originalPrice: '100',
                    //         discountedPrice: '80',
                    //       ),
                    //       ServiceOptionCard(
                    //         title: 'Furniture Cleaning',
                    //         duration: '60 min',
                    //         description: 'Furniture Cleaning',
                    //         originalPrice: '100',
                    //         discountedPrice: '80',
                    //       ),
                    //       ServiceOptionCard(
                    //         title: 'Furniture Cleaning',
                    //         duration: '60 min',
                    //         description: 'Furniture Cleaning',
                    //         originalPrice: '100',
                    //         discountedPrice: '80',
                    //       ),
                    //     ],
                    //   ),
                    //   CategorySection(
                    //     id: '3',
                    //     title: 'Home Deep Cleaning',
                    //     items: [
                    //       ServiceOptionCard(
                    //         title: 'Home Deep Cleaning',
                    //         duration: '60 min',
                    //         description: 'Home Deep Cleaning',
                    //         originalPrice: '100',
                    //         discountedPrice: '80',
                    //       ),
                    //       ServiceOptionCard(
                    //         title: 'Home Deep Cleaning',
                    //         duration: '60 min',
                    //         description: 'Home Deep Cleaning',
                    //         originalPrice: '100',
                    //         discountedPrice: '80',
                    //       ),
                    //       ServiceOptionCard(
                    //         title: 'Home Deep Cleaning',
                    //         duration: '60 min',
                    //         description: 'Home Deep Cleaning',
                    //         originalPrice: '100',
                    //         discountedPrice: '80',
                    //       ),
                    //       ServiceOptionCard(
                    //         title: 'Home Deep Cleaning',
                    //         duration: '60 min',
                    //         description: 'Home Deep Cleaning',
                    //         originalPrice: '100',
                    //         discountedPrice: '80',
                    //       ),
                    //       ServiceOptionCard(
                    //         title: 'Home Deep Cleaning',
                    //         duration: '60 min',
                    //         description: 'Home Deep Cleaning',
                    //         originalPrice: '100',
                    //         discountedPrice: '80',
                    //       ),
                    //       ServiceOptionCard(
                    //         title: 'Home Deep Cleaning',
                    //         duration: '60 min',
                    //         description: 'Home Deep Cleaning',
                    //         originalPrice: '100',
                    //         discountedPrice: '80',
                    //       ),
                    //       ServiceOptionCard(
                    //         title: 'Home Deep Cleaning',
                    //         duration: '60 min',
                    //         description: 'Home Deep Cleaning',
                    //         originalPrice: '100',
                    //         discountedPrice: '80',
                    //       ),
                    //     ],
                    //   ),
                    //   CategorySection(
                    //     id: '4',
                    //     title: 'Home Deep Cleaning',
                    //     items: [
                    //       ServiceOptionCard(
                    //         title: 'Home Deep Cleaning',
                    //         duration: '60 min',
                    //         description: 'Home Deep Cleaning',
                    //         originalPrice: '100',
                    //         discountedPrice: '80',
                    //       ),
                    //     ],
                    //   ),
                    // ],
                    itemBuilder:
                        (context, item, index) => ServiceOptionCard(
                          title: item.title,
                          duration: item.duration,
                          description: item.description,
                          originalPrice: item.originalPrice,
                          discountedPrice: item.discountedPrice,
                        ),
                  ),
                );
              },
            ),

            Divider(color: UIColor.divider, height: 1),
          ],
        ),
      ),
      withBackgroundGradient: true,
    );
  }

  List<ServiceOptionCard> _buildServiceOptions(
    List<ServiceOptionModel> options,
  ) {
    return options
        .map(
          (option) => ServiceOptionCard(
            title: option.title,
            duration: option.durationMinutes.toString(),
            description: option.description,
            originalPrice: option.originalPrice.toString(),
            discountedPrice: option.discountedPrice.toString(),
          ),
        )
        .toList();
  }

  CategorySection<ServiceOptionCard> _buildServiceSection(
    ServiceSectionModel section,
  ) {
    return CategorySection<ServiceOptionCard>(
      id: section.title, //TODO: add id
      title: section.title,
      items: _buildServiceOptions(section.options),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: UI.spacing.md,
        vertical: UI.spacing.xs,
      ),
      color: UIColor.neutral100,
      child: UIText.h3(title, color: UIColor.balck),
    );
  }
}

class _ServiceSectionBanner extends StatelessWidget {
  const _ServiceSectionBanner();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(UI.radius.md),
      child: Container(
        height: 120,
        width: double.infinity,
        color: UIColor.neutral100,
        alignment: Alignment.center,
        child: Icon(
          Icons.plumbing_outlined,
          color: UIColor.neutral500,
          size: UI.sizes.iconLg,
        ),
      ),
    );
  }
}
