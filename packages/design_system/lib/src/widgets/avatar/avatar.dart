import '../../tokens/colors.dart';
import 'package:flutter/material.dart';
import '../../ui.dart';

/// Enum for avatar sizes
enum AvatarSize {
  small,
  medium,
  large,
}

/// A customizable avatar widget that displays user profile images
///
/// Supports three visual states:
/// - Normal: Default appearance
/// - Selected: Shows with a colored border
/// - Disabled: Shows with reduced opacity
///
/// Supports three sizes:
/// - Small (32px)
/// - Medium (48px) - default
/// - Large (64px)
///
/// Example:
/// ```dart
/// // Basic avatar with image
/// Avatar(
///   imageUrl: 'https://example.com/avatar.jpg',
///   name: 'John Doe',
/// )
///
/// // Selected avatar
/// Avatar(
///   imageUrl: 'https://example.com/avatar.jpg',
///   name: 'John Doe',
///   isSelected: true,
/// )
///
/// // Disabled avatar with custom size
/// Avatar(
///   imageUrl: 'https://example.com/avatar.jpg',
///   size: AvatarSize.large,
///   isDisabled: true,
/// )
/// ```
class Avatar extends StatelessWidget {
  /// The URL of the avatar image
  final String? imageUrl;

  /// Asset path for local images
  final String? assetPath;

  /// The name to display below the avatar (optional)
  final String? name;

  /// The size of the avatar
  final AvatarSize size;

  /// Whether the avatar is selected
  final bool isSelected;

  /// Whether the avatar is disabled
  final bool isDisabled;

  /// Callback when the avatar is tapped
  final VoidCallback? onTap;

  /// Whether to show the name below the avatar
  final bool showName;

  /// Custom placeholder widget when image is not available
  final Widget? placeholderWidget;

  /// Border color for selected state (defaults to primary color)
  final Color? selectedBorderColor;

  const Avatar({
    super.key,
    this.imageUrl,
    this.assetPath,
    this.name,
    this.size = AvatarSize.medium,
    this.isSelected = false,
    this.isDisabled = false,
    this.onTap,
    this.showName = true,
    this.placeholderWidget,
    this.selectedBorderColor,
  }) : assert(
          imageUrl != null || assetPath != null || placeholderWidget != null,
          'Either imageUrl, assetPath, or placeholderWidget must be provided',
        );

  /// Get the avatar diameter based on size
  double get _avatarSize {
    switch (size) {
      case AvatarSize.small:
        return UI.sizes.avatarSm;
      case AvatarSize.medium:
        return UI.sizes.avatarMd;
      case AvatarSize.large:
        return UI.sizes.avatarLg;
    }
  }

  /// Get the icon size for placeholder
  double get _placeholderIconSize {
    switch (size) {
      case AvatarSize.small:
        return UI.sizes.iconSm;
      case AvatarSize.medium:
        return UI.sizes.iconMd;
      case AvatarSize.large:
        return UI.sizes.iconLg;
    }
  }

  /// Get text style for name based on avatar size
  TextStyle get _nameTextStyle {
    switch (size) {
      case AvatarSize.small:
        return UI.text.bodyXSmall;
      case AvatarSize.medium:
        return UI.text.bodySmall;
      case AvatarSize.large:
        return UI.text.bodyMedium;
    }
  }

  @override
  Widget build(BuildContext context) {
    final avatarWidget = _buildAvatar();

    // Wrap with opacity if disabled
    Widget result = isDisabled
        ? Opacity(
            opacity: 0.5,
            child: avatarWidget,
          )
        : avatarWidget;

    // Add tap handler if provided
    if (onTap != null && !isDisabled) {
      result = InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(_avatarSize / 2),
        child: result,
      );
    }

    // Add name below if needed
    if (showName && name != null && name!.isNotEmpty) {
      result = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          result,
          SizedBox(height: UI.spacing.xxs),
          Text(
            name!,
            style: _nameTextStyle.copyWith(
              color: isDisabled ? UIColor.neutral400 : UIColor.textPrimary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      );
    }

    return result;
  }

  Widget _buildAvatar() {
    final borderWidth = isSelected ? UI.sizes.avatarBorderWidth : 0.0;
    final effectiveBorderColor = selectedBorderColor ?? UIColor.primary;

    return Container(
      width: _avatarSize,
      height: _avatarSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: isSelected
            ? Border.all(
                color: effectiveBorderColor,
                width: borderWidth,
              )
            : null,
      ),
      child: Padding(
        padding: EdgeInsets.all(isSelected ? 2 : 0),
        child: ClipOval(
          child: _buildAvatarContent(),
        ),
      ),
    );
  }

  Widget _buildAvatarContent() {
    // Try to load image from URL
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return Image.network(
        imageUrl!,
        width: _avatarSize,
        height: _avatarSize,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _buildPlaceholder();
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return _buildLoadingPlaceholder();
        },
      );
    }

    // Try to load image from assets
    if (assetPath != null && assetPath!.isNotEmpty) {
      return Image.asset(
        assetPath!,
        width: _avatarSize,
        height: _avatarSize,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _buildPlaceholder();
        },
      );
    }

    // Use placeholder
    return _buildPlaceholder();
  }

  Widget _buildPlaceholder() {
    if (placeholderWidget != null) {
      return placeholderWidget!;
    }

    return Container(
      width: _avatarSize,
      height: _avatarSize,
      color: UIColor.neutral200,
      child: Icon(
        Icons.person,
        size: _placeholderIconSize,
        color: UIColor.neutral400,
      ),
    );
  }

  Widget _buildLoadingPlaceholder() {
    return Container(
      width: _avatarSize,
      height: _avatarSize,
      color: UIColor.neutral200,
      child: Center(
        child: SizedBox(
          width: _placeholderIconSize,
          height: _placeholderIconSize,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(UIColor.neutral400),
          ),
        ),
      ),
    );
  }
}
