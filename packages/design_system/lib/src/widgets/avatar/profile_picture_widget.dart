// import 'package:design_system/design_system.dart';
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



import 'dart:io';

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../tokens/colors.dart';
import '../../ui.dart';

/// Available avatar sizes following the design system.
enum ProfilePictureSize {
  xs,
  sm,
  md,
  lg,
  xl,
}

/// Size configuration mapped to design tokens.
class _ProfilePictureSizeConfig {
  const _ProfilePictureSizeConfig(this.size);

  final double size;

  static _ProfilePictureSizeConfig fromSize(ProfilePictureSize size) {
    switch (size) {
      case ProfilePictureSize.xs:
        return const _ProfilePictureSizeConfig(24);
      case ProfilePictureSize.sm:
        return const _ProfilePictureSizeConfig(32);
      case ProfilePictureSize.md:
        return const _ProfilePictureSizeConfig(40);
      case ProfilePictureSize.lg:
        return const _ProfilePictureSizeConfig(56);
      case ProfilePictureSize.xl:
        return const _ProfilePictureSizeConfig(72);
    }
  }
}

/// Profile picture widget following the design system.
class ProfilePictureWidget extends StatelessWidget {
  const ProfilePictureWidget({
    super.key,
    this.imageUrl,
    this.initials,
    this.size = ProfilePictureSize.md,
    this.showBorder = false,
    this.isOnline = false,
    this.onTap,
    this.backgroundColor,
  });

  /// Network image url.
  final String? imageUrl;

  /// Fallback initials if image is null.
  final String? initials;

  /// Avatar size variant.
  final ProfilePictureSize size;

  /// Whether to show border.
  final bool showBorder;

  /// Online indicator.
  final bool isOnline;

  /// Tap callback.
  final VoidCallback? onTap;

  /// Custom background color.
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final config = _ProfilePictureSizeConfig.fromSize(size);
    final dimension = config.size;

    final avatar = Container(
      width: dimension,
      height: dimension,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor ?? UIColor.neutral200,
        border:
            showBorder
                ? Border.all(
                  color: UIColor.surface,
                  width: 2,
                )
                : null,
      ),
      clipBehavior: Clip.antiAlias,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(dimension / 2),
        child: _buildContent(context),
      ),
    );

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          avatar,
          if (isOnline) _buildOnlineIndicator(dimension),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      if (imageUrl!.startsWith('http') || imageUrl!.startsWith('https')) {
        return Image.network(
          imageUrl!,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => _buildFallback(),
        );
      } else {
        // Handle local file paths
        return Image.file(
          File(imageUrl!),
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => _buildFallback(),
        );
      }
    }

    return _buildFallback();
  }

  Widget _buildFallback() {
    return Center(
      child: UIText.bodySmall('')
    );
  }

  Widget _buildOnlineIndicator(double size) {
    return Positioned(
      right: -2,
      bottom: -2,
      child: Container(
        width: size * 0.28,
        height: size * 0.28,
        decoration: BoxDecoration(
          color: UIColor.success,
          shape: BoxShape.circle,
          border: Border.all(
            color: UIColor.surface,
            width: 2,
          ),
        ),
      ),
    );
  }
}
