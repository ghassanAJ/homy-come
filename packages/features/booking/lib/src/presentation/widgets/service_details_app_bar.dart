// import 'package:authentication/authentication.dart';
// import 'package:design_system/design_system.dart';
// import 'package:user/di/di_container.dart';

// class ServiceDetailsAppBar extends StatelessWidget {
//   const ServiceDetailsAppBar({
//     super.key,
//     required this.constraints,
//     required this.scrollController,
//   });

//   final BoxConstraints constraints;
//   final ScrollController scrollController;

//   @override
//   Widget build(BuildContext context) {
//     final currentUser = diContainer.get<AppCubit>().state.user;
//     final tabBarHeight = _getTabBarHeight(context);

//     return SliverAppBar(
//       // backgroundColor: UIColor.background,
//       elevation: 0,
//       clipBehavior: Clip.none,
//       floating: false,
//       snap: false,
//       pinned: true,
//       expandedHeight: tabBarHeight + 35, // AppBar height + tab bar height
//       title: AnimatedBuilder(
//         animation: scrollController,
//         builder: (context, child) {
//           // Calculate collapse ratio (0 = expanded, 1 = collapsed)
//           final scrollOffset =
//               scrollController.hasClients ? scrollController.offset : 0.0;
//           final collapseRatio = (scrollOffset / tabBarHeight).clamp(0.0, 1.0);

//           return _buildAnimatedCollapsedTitle(
//             context,
//             currentUser,
//             collapseRatio,
//           );
//         },
//       ),
//       flexibleSpace: FlexibleSpaceBar(
//         background: SafeArea(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(UI.radius.md),
//                 child: Container(
//                   width: double.infinity,
//                   height: 72,
//                   color: UIColor.neutral100,
//                   child: UIImage(Assets.images.onboarding.path),
//                 ),
//               ),
//               SizedBox(height: UI.spacing.sm),

//               UIText.bodySmall('Step 1 to 4', color: UIColor.textSecondary),
//               SizedBox(height: UI.spacing.sm),
//               UIText.h4('Home Cleaning', color: UIColor.balck),
//               SizedBox(height: UI.spacing.xxs),
//               UIText.bodySmall('4.96 (130 Reviews)'),

//               // // const SizedBox(height: 56), // AppBar height
//               // Row(
//               //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //   children: [
//               //     Padding(
//               //       padding: const EdgeInsetsDirectional.only(start: 32),
//               //       child: Align(
//               //         alignment: Alignment.centerLeft,
//               //         child: UIText.h3(
//               //           "Hi ${currentUser?.firstName ?? ''}",
//               //           color: UIColor.primaryDark,
//               //         ),
//               //       ),
//               //     ),
//               //     Padding(
//               //       padding: const EdgeInsetsDirectional.only(end: 16),
//               //       child: IconButton(
//               //         padding: EdgeInsets.zero,
//               //         icon: UISvg(Assets.icons.notification, size: 24),
//               //         onPressed: () {},
//               //       ),
//               //     ),
//               //     //  const SizedBox(width: 12),
//               //   ],
//               // ),
//               // Expanded(child: ChildrenTabBar()),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // ✨ Animated wrapper for collapsed title
//   Widget _buildAnimatedCollapsedTitle(
//     BuildContext context,
//     UserModel? currentUser,
//     double collapseRatio,
//   ) {
//     // Start fading in at 0.7, fully visible at 0.95
//     final opacity =
//         collapseRatio < 0.7
//             ? 0.0
//             : ((collapseRatio - 0.7) / 0.25).clamp(0.0, 1.0);

//     // Slide from top: -20px to 0px
//     final slideOffset = (1.0 - opacity) * -20.0;

//     return IgnorePointer(
//       ignoring: opacity < 0.5, // Disable interaction when barely visible
//       child: AnimatedOpacity(
//         duration: const Duration(milliseconds: 200),
//         curve: Curves.easeOut,
//         opacity: opacity,
//         child: Transform.translate(
//           offset: Offset(0, slideOffset),
//           child: _buildCollapsedTitle(context, currentUser),
//         ),
//       ),
//     );
//   }

//   Widget _buildCollapsedTitle(BuildContext context, UserModel? currentUser) {
//     return Builder(
//       builder: (context) {
//         if (currentUser != null) {
//           return Row(
//             children: [
//               const SizedBox(width: 12),
//               ProfilePictureWidget(
//                 // childName: state.selectedChild?.firstName,
//                 // avatar: state.selectedChild?.profilePicture,
//                 // avatarColor: state.selectedChild?.avatarColor,
//                 // radius: 20,
//                 // fontSize: 20,
//               ),

//               const SizedBox(width: 6),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     UIText.caption(
//                       "${currentUser.firstName} balance",
//                       color: UIColor.neutral500,
//                     ),
//                     UIText.bodySmall(
//                       '${(0.0).toStringAsFixed(0)} AED',
//                       color: UIColor.primaryDark,
//                       fontWeight: FontWeight.w700,
//                       // fontWeight: FontWeight.w400,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         }
//         return Padding(
//           padding: const EdgeInsets.only(left: 16),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             // mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ProfilePictureWidget(
//                 // childName: currentUser?.firstName,
//                 // avatar: currentUser?.profilePicture,
//                 // avatarColor: AvatarColor.primary,
//                 // radius: 20,
//                 // fontSize: 20,
//               ),
//               SizedBox(width: 6),
//               Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   UIText.caption('current balance', color: UIColor.neutral500),
//                   //   const SizedBox(height: 4),
//                   UIText.bodySmall(
//                     '${(0.0).toStringAsFixed(0)} AED',
//                     color: UIColor.primaryDark,
//                     fontWeight: FontWeight.w700,

//                     // fontWeight: FontWeight.w400,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   double _getTabBarHeight(BuildContext context) {
//     return constraints.maxWidth > 500
//         ? MediaQuery.sizeOf(context).height * 0.35
//         : MediaQuery.sizeOf(context).height * 0.1;
//   }
// }
