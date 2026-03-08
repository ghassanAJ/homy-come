import '../../../design_system.dart';

class UICardContainer extends StatelessWidget {
  const UICardContainer({
    super.key,
    required this.child,
    this.padding,
    this.width = double.infinity,
    this.backgroundColor = UIColor.background,
    this.borderRadius,
    this.boxShadow,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double width;
  final Color backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius ?? BorderRadius.circular(UI.radius.md),
        boxShadow: boxShadow ?? UI.shadows.cardMd,
      ),
      child: padding == null ? child : Padding(padding: padding!, child: child),
    );
  }
}
