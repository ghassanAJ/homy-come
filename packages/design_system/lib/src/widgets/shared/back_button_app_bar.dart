import 'package:design_system/design_system.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackButtonAppBar extends StatelessWidget {
  const BackButtonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: UI.spacing.sm),
      padding: EdgeInsets.all(6),
      width: UI.spacing.lg,
      height: UI.spacing.lg,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: UIColor.neutral100,
      ),
      child: SvgPicture.asset(
        Assets.icons.arrowLeft,
        // package: "design_system",
        colorFilter: ColorFilter.mode(UIColor.black, BlendMode.srcIn),
      ),
    );
  }
}
