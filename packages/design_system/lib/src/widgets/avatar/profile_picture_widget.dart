// import 'package:ui/ui.dart';

// class ProfilePictureWidget extends StatelessWidget {
//   const ProfilePictureWidget({
//     super.key,
//     required this.childName,
//     required this.avatar,
//     required this.avatarColor,
//     this.indexOfColor = 0,
//     this.radius = 12,
//     this.fontSize = 12,
//     this.withFlagIcon = false,
//     this.flagIcon,
//     this.flagIconSize = 20,
//   });

//   final String? childName;
//   final String? avatar;
//   final AvatarColor? avatarColor;
//   final double? radius;
//   final double? fontSize;
//   final int indexOfColor;
//   final bool withFlagIcon;
//   final Widget? flagIcon;
//   final double? flagIconSize;
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.bottomRight,
//       children: [_buildAvatar(), if (withFlagIcon) _buildStatusFlag()],
//     );
//   }

//   CircleAvatar _buildAvatar() {
//     return CircleAvatar(
//       key: ValueKey(childName),
//       backgroundColor: avatarColor?.color.withOpacity(0.2),
//       radius: radius,

//       backgroundImage: avatar != null ? MdServerImageProvider(avatar!) : null,
//       child:
//           avatar == null
//               ? Text(
//                 childName?.isNotEmpty ?? false
//                     ? childName![0].toUpperCase()
//                     : '?',
//                 style: TextStyle(
//                   color: avatarColor?.color,
//                   fontWeight: FontWeight.w400,
//                   fontSize: fontSize,
//                 ),
//               )
//               : null,
//     );
//   }

//   Widget _buildStatusFlag() {
//     return Container(
//       width: flagIconSize,
//       height: flagIconSize,
//       padding: const EdgeInsets.all(4),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.white, width: 2),
//         shape: BoxShape.circle,
//         color: MDTheme.styles.warningColor,
//       ),
//       child:
//           flagIcon ??
//           SvgPicture.asset(
//             'assets/icons/warning.svg',
//             package: 'ui',
//             color: MDTheme.styles.shade000,
//           ),
//     );
//   }
// }
