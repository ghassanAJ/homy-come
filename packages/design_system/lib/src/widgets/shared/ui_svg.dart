import 'package:design_system/design_system.dart';
import 'package:flutter_svg/svg.dart';

class UISvg extends StatelessWidget {
  const UISvg(
    this.icon, {
    super.key,
    this.color,
    this.package,
    this.matchTextDirection = false,
    this.size,
  });

  final String icon;
  final UIColor? color;
  final String? package;
  final bool matchTextDirection;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      package: package,
      matchTextDirection: matchTextDirection,
      colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      width: size,
      height: size,
    );
  }
}
