import 'package:flutter/material.dart';

import '../../tokens/colors.dart';
import '../../tokens/radius.dart';
import '../../tokens/spacing.dart';

class UIBottomSheet extends StatelessWidget {
  /// The content to display in the bottom sheet
  final Widget content;

  /// Whether to show the handle indicator at the top
  final bool showHandleIndicator;

  /// Maximum height constraint as a fraction of the screen height
  final double? maxHeightFactor;

  /// Background color of the bottom sheet
  final Color? backgroundColor;

  /// Padding around the content
  final EdgeInsetsGeometry contentPadding;

  const UIBottomSheet({
    super.key,
    required this.content,
    this.showHandleIndicator = true,
    this.maxHeightFactor,
    this.backgroundColor,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 24.0,
    ),
  });

  /// Static method to show the bottom sheet
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget content,
    bool isDismissible = true,
    bool enableDrag = true,
    bool showHandleIndicator = true,
    double? maxHeightFactor,
    Color? backgroundColor,
    EdgeInsetsGeometry contentPadding = const EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 24.0,
    ),
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return UIBottomSheet(
          content: content,
          showHandleIndicator: showHandleIndicator,
          maxHeightFactor: maxHeightFactor,
          backgroundColor: backgroundColor,
          contentPadding: contentPadding,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get available height (screen height minus status bar)
    final availableHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    // Get keyboard height to adjust padding
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.only(bottom: keyboardHeight),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: maxHeightFactor != null
              ? availableHeight * maxHeightFactor!
              : availableHeight * 0.9,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor ?? UIColor.surface,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(UIRadius().xl),
              topRight: Radius.circular(UIRadius().xl),
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Drag indicator handle at the top
                if (showHandleIndicator) _buildHandleIndicator(),

                // Main content
                Flexible(
                  child: SingleChildScrollView(
                    padding: contentPadding,
                    child: content,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the handle indicator at the top of the bottom sheet
  Widget _buildHandleIndicator() {
    return Container(
      margin: EdgeInsets.only(top: UISpacing().md),
      width: 60,
      height: 3,
      decoration: BoxDecoration(
        color: UIColor.grey5,
        borderRadius: BorderRadius.circular(UIRadius().xs),
      ),
    );
  }
}
