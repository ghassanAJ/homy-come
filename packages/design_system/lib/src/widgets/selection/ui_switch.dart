import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

import '../../tokens/colors.dart';

/// A design-system compliant toggle switch.
///
/// Wraps [CupertinoSwitch] to centralize styling defaults together with
/// support for optional Cupertino behaviors such as focus and thumb images.
class UISwitch extends StatelessWidget {
  /// Creates a UISwitch with Maddo design defaults.
  ///
  /// The [value] parameter determines whether the switch is on or off.
  /// When the user toggles the switch, [onChanged] is called with the new value.
  const UISwitch({
    super.key,
    required this.value,
    this.onChanged,
    this.scale = 0.8,
    this.activeTrackColor,
    this.inactiveTrackColor,
    this.thumbColor,
    this.inactiveThumbColor,
    this.applyTheme,
    this.focusColor,
    this.onLabelColor,
    this.offLabelColor,
    this.activeThumbImage,
    this.onActiveThumbImageError,
    this.inactiveThumbImage,
    this.onInactiveThumbImageError,
    this.trackOutlineColor,
    this.trackOutlineWidth,
    this.thumbIcon,
    this.mouseCursor,
    this.focusNode,
    this.onFocusChange,
    this.autofocus = false,
    this.dragStartBehavior = DragStartBehavior.start,
  }) : assert(scale > 0, 'UISwitch scale must be greater than zero');

  /// Whether this switch is on or off.
  final bool value;

  /// Called when the user toggles the switch on or off.
  final ValueChanged<bool>? onChanged;

  /// Transform scale applied to the switch. Defaults to `0.8` to match design.
  final double scale;

  /// Color of the track when the switch is on. Defaults to `UIColor.tertiary`.
  final Color? activeTrackColor;

  /// Color of the track when the switch is off. Defaults to `UIColor.neutral200`.
  final Color? inactiveTrackColor;

  /// Color of the thumb when the switch is on or focused.
  final Color? thumbColor;

  /// Color of the thumb when the switch is off. Defaults to `UIColor.neutral000`.
  final Color? inactiveThumbColor;

  /// Applies the ambient Cupertino theme when true.
  final bool? applyTheme;

  /// Focus highlight color.
  final Color? focusColor;

  /// Color for the "on" label when present.
  final Color? onLabelColor;

  /// Color for the "off" label when present.
  final Color? offLabelColor;

  /// Image displayed on the thumb when active.
  final ImageProvider<Object>? activeThumbImage;

  /// Error callback for [activeThumbImage].
  final ImageErrorListener? onActiveThumbImageError;

  /// Image displayed on the thumb when inactive.
  final ImageProvider<Object>? inactiveThumbImage;

  /// Error callback for [inactiveThumbImage].
  final ImageErrorListener? onInactiveThumbImageError;

  /// Color of the track outline resolved per widget state.
  final WidgetStateProperty<Color?>? trackOutlineColor;

  /// Width of the track outline resolved per widget state.
  final WidgetStateProperty<double?>? trackOutlineWidth;

  /// Optional icon to display within the thumb, resolved per widget state.
  final WidgetStateProperty<Icon?>? thumbIcon;

  /// Mouse cursor resolved per widget state.
  final WidgetStateProperty<MouseCursor>? mouseCursor;

  /// Focus node used to manage focus state.
  final FocusNode? focusNode;

  /// Callback invoked when the focus state changes.
  final ValueChanged<bool>? onFocusChange;

  /// Whether this widget is focused initially.
  final bool autofocus;

  /// How drag start behavior is detected.
  final DragStartBehavior dragStartBehavior;

  @override
  Widget build(BuildContext context) {
    final cupertinoSwitch = CupertinoSwitch(
      value: value,
      onChanged: onChanged,
      activeTrackColor: activeTrackColor ?? UIColor.tertiary,
      inactiveTrackColor: inactiveTrackColor ?? UIColor.neutral200,
      thumbColor: thumbColor,
      inactiveThumbColor: inactiveThumbColor ?? UIColor.neutral000,
      applyTheme: applyTheme,
      focusColor: focusColor,
      onLabelColor: onLabelColor,
      offLabelColor: offLabelColor,
      activeThumbImage: activeThumbImage,
      onActiveThumbImageError: onActiveThumbImageError,
      inactiveThumbImage: inactiveThumbImage,
      onInactiveThumbImageError: onInactiveThumbImageError,
      trackOutlineColor: trackOutlineColor,
      trackOutlineWidth: trackOutlineWidth,
      thumbIcon: thumbIcon,
      mouseCursor: mouseCursor,
      focusNode: focusNode,
      onFocusChange: onFocusChange,
      autofocus: autofocus,
      dragStartBehavior: dragStartBehavior,
    );

    if (scale == 1.0) {
      return cupertinoSwitch;
    }

    return Transform.scale(
      scale: scale,
      child: cupertinoSwitch,
    );
  }
}
