// import 'package:booking/booking.dart';
// import 'package:booking/src/presentation/widgets/service_details_app_bar.dart';
// import 'package:booking/src/presentation/widgets/service_widgets/service_details_appbar.dart';

// import '../widgets/service_widgets/category_section.dart';

// class ServiceDetailsScreenOld extends StatefulWidget {
//   const ServiceDetailsScreenOld({super.key});

//   @override
//   State<ServiceDetailsScreenOld> createState() =>
//       _ServiceDetailsScreenOldState();
// }

// class _ServiceDetailsScreenOldState extends State<ServiceDetailsScreenOld> {
//   late final ServiceDetailsCubit _cubit;
//   final ScrollController _scrollController = ScrollController();

//   @override
//   void initState() {
//     super.initState();
//     _cubit = ServiceDetailsCubit(MockBookingRepository());
//     _cubit.fetchServiceDetails(serviceId: 'home-deep-cleaning');
//   }

//   @override
//   void dispose() {
//     _cubit.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final topContentPadding =
//         MediaQuery.paddingOf(context).top + kToolbarHeight + UI.spacing.sm;

//     return Scaffold(
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           return NestedScrollView(
//             headerSliverBuilder:
//                 (context, innerBoxIsScrolled) => [
//                   ServiceDetailsAppBar(
//                     constraints: constraints,
//                     scrollController: _scrollController,
//                   ),
//                 ],
//             body: BlocProvider.value(
//               value: _cubit,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // SizedBox(height: topContentPadding),
//                   // Padding(
//                   //   padding: const EdgeInsets.all(8.0),
//                   //   child: ClipRRect(
//                   //     borderRadius: BorderRadius.circular(UI.radius.md),
//                   //     child: Container(
//                   //       width: double.infinity,
//                   //       // height: 72,
//                   //       color: UIColor.neutral100,
//                   //       child: UIImage(Assets.images.onboarding.path),
//                   //     ),
//                   //   ),
//                   // ),
//                   // SizedBox(height: UI.spacing.sm),
//                   // UIText.h4('Home Cleaning', color: UIColor.balck),
//                   // SizedBox(height: UI.spacing.sm),

//                   // BlocBuilder<
//                   //   ServiceDetailsCubit,
//                   //   BaseState<ServiceDetailsResponseModel>
//                   // >(
//                   //   builder: (context, state) {
//                   //     if (state.status == BaseCubitStatus.loading) {
//                   //       return UIProgressIndicator();
//                   //     }
//                   //     if (state.status == BaseCubitStatus.error) {
//                   //       return Center(
//                   //         child: UIText.bodyMedium(state.error?.message ?? ''),
//                   //       );
//                   //     }
//                   //     return Expanded(
//                   //       child: CategoryTabSectionView<ServiceOptionCard>(
//                   //         tabChanged: (index) {
//                   //           print('tabChanged: $index');
//                   //         },
//                   //         // tabBuilder:
//                   //         //     (context, title, isActive) => ServiceCategoryChip(
//                   //         //       label: title,
//                   //         //       selected: isActive,
//                   //         //       onTap: () {},
//                   //         //     ),
//                   //         sections:
//                   //             state.data!.sections
//                   //                 .map(
//                   //                   (section) =>
//                   //                       CategorySection<ServiceOptionCard>(
//                   //                         id: section.title, // TODO: add id
//                   //                         title: section.title,
//                   //                         items: _buildServiceOptions(
//                   //                           section.options,
//                   //                         ),
//                   //                       ),
//                   //                 )
//                   //                 .toList(),

//                   //         itemBuilder:
//                   //             (context, item, index) => ServiceOptionCard(
//                   //               onAddButtonPressed: () {
//                   //                 context.push(UserPaths.serviceDetails);
//                   //               },
//                   //               title: item.title,
//                   //               duration: item.duration,
//                   //               description: item.description,
//                   //               originalPrice: item.originalPrice,
//                   //               discountedPrice: item.discountedPrice,
//                   //             ),
//                   //       ),
//                   //     );
//                   //   },
//                   // ),
//                   Divider(color: UIColor.divider, height: 1),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//       // withBackgroundGradient: true,
//     );
//   }

//   List<AddOnCard> _buildServiceOptions(List<ServiceOptionModel> options) {
//     return options
//         .map(
//           (option) => AddOnCard(
//             onAddButtonPressed: () {},
//             data: AddOnServiceModel(
//               id: option.id,
//               documentId: option.id,
//               durationMinutes: option.durationMinutes,
//               info: InfoModel(
//                 name: option.title,
//                 description: option.description,
//                 image: option.imageUrl,
//               ),
//               price: ServicePriceModel(
//                 currentPrice: option.originalPrice,
//                 newPrice: option.discountedPrice,
//               ),
//             ),
//           ),
//         )
//         .toList();
//   }

//   CategorySection<AddOnCard> _buildServiceSection(ServiceSectionModel section) {
//     return CategorySection<AddOnCard>(
//       id: section.title, //TODO: add id
//       title: section.title,
//       items: _buildServiceOptions(section.options),
//     );
//   }
// }

// class _SectionHeader extends StatelessWidget {
//   const _SectionHeader({required this.title});

//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(
//         horizontal: UI.spacing.md,
//         vertical: UI.spacing.xs,
//       ),
//       color: UIColor.neutral100,
//       child: UIText.h3(title, color: UIColor.balck),
//     );
//   }
// }

// class _ServiceSectionBanner extends StatelessWidget {
//   const _ServiceSectionBanner();

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(UI.radius.md),
//       child: Container(
//         height: 120,
//         width: double.infinity,
//         color: UIColor.neutral100,
//         alignment: Alignment.center,
//         child: Icon(
//           Icons.plumbing_outlined,
//           color: UIColor.neutral500,
//           size: UI.sizes.iconLg,
//         ),
//       ),
//     );
//   }
// }
