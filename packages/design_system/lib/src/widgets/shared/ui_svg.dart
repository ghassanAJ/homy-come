import 'package:design_system/design_system.dart';
import 'package:flutter_svg/svg.dart';

class UISvg extends StatelessWidget {
  const UISvg({super.key, required this.icon, this.color});
  final String icon;
  final UIColor? color;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      colorFilter: ColorFilter.mode(color ?? UIColor.grey, BlendMode.srcIn),
    );
  }
}
