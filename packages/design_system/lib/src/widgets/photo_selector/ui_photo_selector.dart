import 'dart:io';

import 'package:flutter/material.dart';

import '../../tokens/colors.dart';
import '../painters/dashed_border_painter.dart';
import '../text/ui_text.dart';

/// A reusable photo selector widget that displays either:
/// - An empty state with "Add photo" message
/// - A selected photo with "Change photo" message
///
/// The widget provides a consistent UI for photo selection across the app.
class UIPhotoSelector extends StatelessWidget {
  /// The currently selected image (can be a network URL or file path)
  final String? selectedImagePath;

  /// Whether the selected image is a network URL (true) or local file path (false)
  final bool isNetworkImage;

  /// Callback when the photo selector is tapped
  final VoidCallback onTap;

  /// Custom widget builder for the image
  /// If provided, this will be used instead of the default image display
  final Widget Function(String imagePath)? imageBuilder;

  /// The icon to display in the empty state
  /// If null, a default icon will be shown
  final Widget? emptyStateIcon;

  /// The text to display when no photo is selected
  final String emptyStateText;

  /// The text to display when a photo is selected
  final String selectedStateText;

  /// The size of the image preview
  final double imageSize;

  /// The border radius of the component
  final double borderRadius;

  /// Whether to show a dashed border in the empty state
  final bool showDashedBorder;

  const UIPhotoSelector({
    super.key,
    this.selectedImagePath,
    this.isNetworkImage = false,
    required this.onTap,
    this.imageBuilder,
    this.emptyStateIcon,
    this.emptyStateText = 'Add photo (Optional)',
    this.selectedStateText = 'Change photo',
    this.imageSize = 40,
    this.borderRadius = 12,
    this.showDashedBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    final hasImage = selectedImagePath != null;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: UIColor.border, width: 1),
        ),
        child: hasImage ? _buildSelectedState() : _buildEmptyState(),
      ),
    );
  }

  Widget _buildEmptyState() {
    if (showDashedBorder) {
      return Row(
        children: [
          Container(
            width: imageSize,
            height: imageSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: CustomPaint(
              painter: DashedBorderPainter(
                color: UIColor.primary,
                strokeWidth: 1,
                borderRadius: 8,
                dashWidth: 6,
                dashSpace: 4,
              ),
              child: Center(
                child: emptyStateIcon ??
                    Icon(
                      Icons.add_photo_alternate_outlined,
                      color: UIColor.primary,
                      size: 24,
                    ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          UIText.bodyMedium(
            emptyStateText,
            color: UIColor.textPrimary,
          ),
        ],
      );
    }

    return Row(
      children: [
        Container(
          width: imageSize,
          height: imageSize,
          decoration: BoxDecoration(
            color: UIColor.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Center(
            child: emptyStateIcon ??
                Icon(
                  Icons.add_photo_alternate_outlined,
                  color: UIColor.primary,
                  size: 24,
                ),
          ),
        ),
        const SizedBox(width: 10),
        UIText.bodyMedium(
          emptyStateText,
          color: UIColor.textPrimary,
        ),
      ],
    );
  }

  Widget _buildSelectedState() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            height: imageSize,
            width: imageSize,
            child: imageBuilder?.call(selectedImagePath!) ??
                _buildDefaultImage(),
          ),
        ),
        const SizedBox(width: 10),
        UIText.bodyMedium(selectedStateText, color: UIColor.textPrimary),
      ],
    );
  }

  Widget _buildDefaultImage() {
    if (isNetworkImage) {
      return Image.network(
        selectedImagePath!,
        fit: BoxFit.cover,
        width: double.infinity,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Center(
              child: Icon(
                Icons.broken_image_outlined,
                color: UIColor.textSecondary,
                size: 24,
              ),
            ),
          );
        },
      );
    } else {
      return Image.file(
        File(selectedImagePath!),
        fit: BoxFit.cover,
        width: double.infinity,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Center(
              child: Icon(
                Icons.broken_image_outlined,
                color: UIColor.textSecondary,
                size: 24,
              ),
            ),
          );
        },
      );
    }
  }
}
