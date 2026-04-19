import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user/navigation/route.dart';

class SectionHeaderAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SectionHeaderAppBar({
    required this.title,
    super.key,
    this.actions,
  });

  final String title;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(60);

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
          onTap: () => context.go(UserPaths.home),
          child: UIIconBackground(
            size: 30,
            backgroundColor: UIColor.neutral100,
            borderRadius: BorderRadius.circular(UI.radius.sm),
            child: UISvg(Assets.icons.arrowLeft, color: UIColor.neutral900),
          ),
        ),
      ),
      actions: actions,
    );
  }
}
