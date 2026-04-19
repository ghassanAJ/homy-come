import 'package:design_system/design_system.dart';
import 'package:design_system/src/widgets/shared/ui_tap_effect.dart';

class UIIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final double size;
  final Color? iconColor;
  final EdgeInsets padding;
  final String? tooltip;
  final Color? backgroundColor;

  const UIIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.onLongPress,
    this.size = 20,
    this.iconColor,
    this.padding = const EdgeInsets.all(8),
    this.tooltip,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    Widget icon = IconTheme.merge(
      data: IconThemeData(color: iconColor ?? UIColor.primary, size: size),
      child: this.icon,
    );

    Widget button = Material(
      type:
          backgroundColor == null
              ? MaterialType.transparency
              : MaterialType.circle,
      color: backgroundColor,
      child: buildPlatformWrapper(context: context, child: icon),
    );

    if (tooltip != null) {
      button = Tooltip(message: tooltip ?? '', child: button);
    }

    return Container(padding: const EdgeInsets.all(4), child: button);
  }

  Widget buildPlatformWrapper({
    required Widget child,
    required BuildContext context,
  }) {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return InkWell(
          customBorder: const CircleBorder(),
          onTap: onPressed,
          onLongPress: onLongPress,
          child: Padding(padding: padding, child: child),
        );
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return UITapEffect(
          onTap: onPressed,
          onLongPressed: onLongPress,
          child: Padding(padding: padding, child: child),
        );
    }
  }
}
