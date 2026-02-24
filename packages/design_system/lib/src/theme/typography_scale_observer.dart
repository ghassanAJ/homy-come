import 'package:flutter/material.dart';
import 'typography_scaling.dart';

/// Widget that automatically observes and updates typography scaling
/// based on MediaQuery changes (user font size settings or device rotation)
///
/// Wrap your app with this widget, typically right inside MaterialApp
class TypographyScaleObserver extends StatefulWidget {
  /// The child widget that will benefit from typography scaling
  final Widget child;

  /// Optional text scale weight to apply (0.0 to 1.0)
  /// - 1.0 = fully respect user settings
  /// - 0.0 = ignore user settings (not recommended for accessibility)
  final double? textScaleWeight;

  /// Creates a new TypographyScaleObserver
  const TypographyScaleObserver({
    super.key,
    required this.child,
    this.textScaleWeight,
  });

  @override
  State<TypographyScaleObserver> createState() =>
      _TypographyScaleObserverState();
}

class _TypographyScaleObserverState extends State<TypographyScaleObserver>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // Set text scale weight if provided
    if (widget.textScaleWeight != null) {
      TypographyScaling().setTextScaleWeight(widget.textScaleWeight!);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    // This is called when the window metrics change
    // which includes when the textScaleFactor changes
    if (mounted) {
      _updateScaling();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Update scaling when the widget is first built
    // and whenever it rebuilds (which could be due to context changes)
    _updateScaling();

    // Just pass through the child widget
    return widget.child;
  }

  void _updateScaling() {
    // Update the scaling system with the current MediaQuery data
    TypographyScaling().updateScalingFromContext(context);
  }
}
