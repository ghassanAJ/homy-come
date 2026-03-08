import 'package:design_system/design_system.dart';

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
      child: UISvg(
        Assets.icons.arrowLeft,
        color: UIColor.black,
        matchTextDirection: true,
        // package: "design_system",
      ),
    );
  }
}
