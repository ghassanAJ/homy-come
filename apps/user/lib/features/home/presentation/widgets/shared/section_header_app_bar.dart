import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';
import 'package:user/navigation/route.dart';

class SectionHeaderAppBar extends StatelessWidget {
  const SectionHeaderAppBar({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return UIAppBar(
      backgroundColor: UIColor.white,
      toolbarHeight: 60,
      centerTitle: true,
      titleWidget: UIText.bodyMedium(
        title,
        fontWeight: FontWeight.w700,
        fontSize: 18,
        color: UIColor.black,
      ),
      leadingWidth: 76,
      leading: Align(
        alignment: Alignment.centerLeft,
        child: GestureDetector(
          onTap: () => context.go(UserPaths.home),
          child: UIIconBackground(
            size: 30,
            backgroundColor: UIColor.neutral100,
            borderRadius: BorderRadius.circular(UI.radius.sm),
            child: UISvg(Assets.icons.arrowLeft, color: UIColor.neutral900),
          ),
        ),
      ),
    );
  }
}
