import 'package:flutter/widgets.dart';

class UIIconBackground extends StatelessWidget {
  final Widget child;
  final double? size;
  final double? iconSize;
  final Color backgroundColor;

  const UIIconBackground({
    required this.child,
    this.size,
    this.iconSize,
    required this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
      alignment: Alignment.center,
      child: SizedBox(width: iconSize, height: iconSize, child: child),
    );
  }
}
