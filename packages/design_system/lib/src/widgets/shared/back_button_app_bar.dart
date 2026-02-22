import 'package:design_system/design_system.dart';
import 'package:flutter_svg/flutter_svg.dart';

class backButtonAppBar extends StatelessWidget {
  const backButtonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: UI.spacing.sm),
      padding: EdgeInsets.all(UI.spacing.xxs),
      width: UI.spacing.lg,
      height: UI.spacing.lg,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: UIColor.neutral100,
      ),
      child: SvgPicture.asset(
        Assets.icons.arrowLeft,
        colorFilter: ColorFilter.mode(UIColor.black, BlendMode.srcIn),
      ),    );
  }
}
