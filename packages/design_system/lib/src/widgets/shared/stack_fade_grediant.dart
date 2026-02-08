import '../../../design_system.dart';

/// A widget that applies a gradient fade effect on specified edges
///
/// Wraps a child widget with gradient overlays on the top, right, bottom,
/// and/or left edges to create a fade-out effect.
///
/// Example:
/// ```dart
/// GradientFadeStack(
///   child: ListView(...),
///   fadeRight: true,
///   fadeLeft: true,
///   width: 40,
/// )
/// ```
class GradientFadeStack extends StatelessWidget {
  const GradientFadeStack({
    required this.child,
    this.width = 40,
    this.color = UIColor.white,
    this.fadeTop = false,
    this.fadeRight = true, // Default to right for backward compatibility
    this.fadeBottom = false,
    this.fadeLeft = false,
    super.key,
  });

  /// The child widget to wrap with gradient fade
  final Widget child;

  /// Width/height of the gradient fade effect (in pixels)
  final double width;

  /// Base color for the gradient (fades from this color to transparent)
  final Color color;

  /// Whether to apply fade effect on the top edge
  final bool fadeTop;

  /// Whether to apply fade effect on the right edge
  final bool fadeRight;

  /// Whether to apply fade effect on the bottom edge
  final bool fadeBottom;

  /// Whether to apply fade effect on the left edge
  final bool fadeLeft;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        // Top fade
        if (fadeTop) _buildGradient(context, GradientFadeSide.top),
        // Right fade
        if (fadeRight) _buildGradient(context, GradientFadeSide.right),
        // Bottom fade
        if (fadeBottom) _buildGradient(context, GradientFadeSide.bottom),
        // Left fade
        if (fadeLeft) _buildGradient(context, GradientFadeSide.left),
      ],
    );
  }

  Widget _buildGradient(BuildContext context, GradientFadeSide side) {
    return Positioned(
      top: side == GradientFadeSide.top ? 0 : null,
      right: side == GradientFadeSide.right ? 0 : null,
      bottom: side == GradientFadeSide.bottom ? 0 : null,
      left: side == GradientFadeSide.left ? 0 : null,
      // For horizontal fades (left/right), constrain width
      // For vertical fades (top/bottom), constrain height
      width: _isHorizontalFade(side) ? width : null,
      height: _isVerticalFade(side) ? width : null,
      // For horizontal fades, expand height; for vertical, expand width
      child: _isHorizontalFade(side)
          ? SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: _gradientContainer(side),
            )
          : SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: _gradientContainer(side),
            ),
    );
  }

  Widget _gradientContainer(GradientFadeSide side) {
    return IgnorePointer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: _getGradientBegin(side),
            end: _getGradientEnd(side),
            colors: [color, color.withOpacity(0.0)],
          ),
        ),
      ),
    );
  }

  bool _isHorizontalFade(GradientFadeSide side) =>
      side == GradientFadeSide.left || side == GradientFadeSide.right;

  bool _isVerticalFade(GradientFadeSide side) =>
      side == GradientFadeSide.top || side == GradientFadeSide.bottom;

  Alignment _getGradientBegin(GradientFadeSide side) {
    switch (side) {
      case GradientFadeSide.top:
        return Alignment.topCenter;
      case GradientFadeSide.right:
        return Alignment.centerRight;
      case GradientFadeSide.bottom:
        return Alignment.bottomCenter;
      case GradientFadeSide.left:
        return Alignment.centerLeft;
    }
  }

  Alignment _getGradientEnd(GradientFadeSide side) {
    switch (side) {
      case GradientFadeSide.top:
        return Alignment.bottomCenter;
      case GradientFadeSide.right:
        return Alignment.centerLeft;
      case GradientFadeSide.bottom:
        return Alignment.topCenter;
      case GradientFadeSide.left:
        return Alignment.centerRight;
    }
  }
}

/// Enum to represent gradient fade sides
enum GradientFadeSide { top, right, bottom, left }
