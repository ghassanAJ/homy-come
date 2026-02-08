// import 'package:authentication/authentication.dart';
// import 'package:authentication/src/presentation/widgets/user_role_selection/user_role_selection_header.dart';
// import 'package:authentication/src/presentation/widgets/user_role_selection/user_role_selection_options.dart';
// import 'package:design_system/design_system.dart';

// class UserRoleSelectionScreen extends StatefulWidget {
//   const UserRoleSelectionScreen({super.key});

//   @override
//   State<UserRoleSelectionScreen> createState() =>
//       _UserRoleSelectionScreenState();
// }

// class _UserRoleSelectionScreenState extends State<UserRoleSelectionScreen> {
//   UserRole _selectedRole = UserRole.parent;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: UIColor.background,
//       body: AuthEllipseBackground(
//         child: SafeArea(
//           child: LayoutBuilder(
//             builder: (context, constraints) {
//               return SingleChildScrollView(
//                 child: ConstrainedBox(
//                   constraints: BoxConstraints(minHeight: constraints.maxHeight),
//                   child: IntrinsicHeight(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 24),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(height: 60),

//                           // Header Section
//                           UserRoleSelectionHeader(),

//                           const Spacer(),

//                           // Role Options
//                           UserRoleSelectionOptions(
//                             selectedRole: _selectedRole,
//                             onRoleChanged: (role) {
//                               setState(() {
//                                 _selectedRole = role;
//                               });
//                             },
//                           ),

//                           const SizedBox(height: 40),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
