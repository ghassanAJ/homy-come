import 'package:design_system/gen/assets.gen.dart';
import 'package:design_system/src/widgets/shared/ui_svg.dart';
import 'package:flutter/material.dart';

import '../../tokens/colors.dart';
import '../../ui.dart';
import '../text/ui_text.dart';
import 'ui_bottom_sheet.dart';

class UIImageSelectionBottomSheet extends StatelessWidget {
  /// Callback when "Choose from library" is selected
  final VoidCallback onChooseFromLibrary;

  /// Callback when "Take photo" is selected
  final VoidCallback onTakePhoto;

  /// Callback when "Delete" is selected
  final VoidCallback? onDelete;

  /// Whether to show the delete option
  final bool showDelete;

  const UIImageSelectionBottomSheet({
    super.key,
    required this.onChooseFromLibrary,
    required this.onTakePhoto,
    this.onDelete,
    this.showDelete = false,
  }) : assert(
         !showDelete || onDelete != null,
         'onDelete must be provided if showDelete is true',
       );

  /// Shows the image selection bottom sheet
  static Future<void> show({
    required BuildContext context,
    required VoidCallback onChooseFromLibrary,
    required VoidCallback onTakePhoto,
    VoidCallback? onDelete,
    bool showDelete = false,
  }) {
    return UIBottomSheet.show(
      context: context,
      content: UIImageSelectionBottomSheet(
        onChooseFromLibrary: onChooseFromLibrary,
        onTakePhoto: onTakePhoto,
        onDelete: onDelete,
        showDelete: showDelete,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Choose from library option
        _buildOption(
          iconPath: Assets.icons.gallery,
          label: 'Choose from library',
          onTap: onChooseFromLibrary,
          textColor: UIColor.primaryDark,
          iconColor: UIColor.primaryDark,
        ),
        SizedBox(height: UI.spacing.lg),

        // Take photo option
        _buildOption(
          iconPath: Assets.icons.camera,
          label: 'Take photo',
          onTap: onTakePhoto,
          textColor: UIColor.primaryDark,
          iconColor: UIColor.primaryDark,
        ),

        // Delete option (only shown if onDelete is provided)
        if (showDelete) ...[
          SizedBox(height: UI.spacing.lg),
          _buildOption(
            iconPath: Assets.icons.trash,
            label: 'Delete',
            onTap: onDelete!,
            textColor: UIColor.error,
            iconColor: UIColor.error,
          ),
        ],
      ],
    );
  }

  /// Builds an option row with icon and label
  Widget _buildOption({
    required String iconPath,
    required String label,
    required VoidCallback onTap,
    required UIColor textColor,
    required UIColor iconColor,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(UI.radius.md),
      child: Row(
        children: [
          UISvg(iconPath),
          SizedBox(width: UI.spacing.xs),
          UIText.bodyMedium(label, color: textColor),
        ],
      ),
    );
  }
}
