import 'package:flutter/widgets.dart';

class UIIconBackground extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final double? size;
  final double? iconSize;
  final Color backgroundColor;
  final BorderRadiusGeometry? borderRadius;

  const UIIconBackground({
    required this.child,
    this.width,
    this.height,
    this.size,
    this.iconSize,
    required this.backgroundColor,
    this.borderRadius,
    super.key,
    this.padding,
  });
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final bool isCircle = borderRadius == null;

    return Container(
      width: width ?? size,
      padding: padding,
      height: height ?? size,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: isCircle ? null : borderRadius,
      ),
      alignment: Alignment.center,
      child: SizedBox(width: iconSize, height: iconSize, child: child),
    );
  }
}
