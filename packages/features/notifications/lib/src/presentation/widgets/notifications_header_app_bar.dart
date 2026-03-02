import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';

class NotificationsHeaderAppBar extends StatelessWidget {
  const NotificationsHeaderAppBar({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return UIAppBar(
      toolbarHeight: 60,
      centerTitle: true,
      titleWidget: UIText.bodyLarge(
        title,
        fontWeight: FontWeight.w700,
        color: UIColor.black,
      ),
      leadingWidth: 76,
      leading: Align(
        alignment: Alignment.centerLeft,
        child: GestureDetector(
          onTap: () => context.pop(),
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
