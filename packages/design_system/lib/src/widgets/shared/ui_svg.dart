import 'package:design_system/design_system.dart';
import 'package:flutter_svg/svg.dart';

class UISvg extends StatelessWidget {
  const UISvg(this.icon, {super.key, this.color, this.package});
  final String icon;
  final UIColor? color;
  final String? package;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
    );
  }
}
