import 'package:design_system/design_system.dart';

class SettingsRow extends StatelessWidget {
  const SettingsRow({
    super.key,
    required this.title,
    this.titleBuilder,
    this.trailing,
    this.onTap,
    this.titleColor = UIColor.neutral300,
    this.showDivider = true,
  });

  final String title;

  final Widget Function(String title, UIColor color)? titleBuilder;

  final Widget? trailing;
  final VoidCallback? onTap;
  final UIColor titleColor;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final content = SizedBox(
      height: UI.spacing.xxl2 - UI.spacing.xxs,
      child: Row(
        children: [
          Expanded(
            child:
                titleBuilder?.call(title, titleColor) ??
                UIText.bodySmall(
                  title,
                  color: titleColor,
                  fontWeight: FontWeight.w500,
                ),
          ),
          trailing ??
              UISvg(
                Assets.icons.arrowRightSvg,
                color: UIColor.textGray,
                matchTextDirection: true,
              ),
        ],
      ),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: UI.padding.driverProfileSettingsRowContent,
            child: content,
          ),
        ),
        if (showDivider) Divider(color: UIColor.neutral100, thickness: 4),
      ],
    );
  }
}
