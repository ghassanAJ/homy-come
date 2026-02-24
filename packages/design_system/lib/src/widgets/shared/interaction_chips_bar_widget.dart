
import 'package:design_system/design_system.dart';

class InteractiveChipsBar extends StatelessWidget {
  const InteractiveChipsBar({
    super.key,
    this.selectcolor,
    this.color,
    required this.labal,
    required this.isSelect,
    required this.onSelect,
  });

  final UIColor? selectcolor;
  final UIColor? color;
  final String labal;
  final bool isSelect;
  final ValueChanged<bool> onSelect;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelect(!isSelect),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: UI.spacing.xxs),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: UI.spacing.md,
          vertical: UI.spacing.xxs,
        ),
        decoration: BoxDecoration(
          color:
              isSelect
                  ? (selectcolor ?? UIColor.babyBlue)
                  : (color ?? UIColor.neutral100),
          borderRadius: BorderRadius.circular(UI.radius.sm),
        ),
        child: UIText.buttonTextXsm(
          overflow: TextOverflow.clip,
          labal,
          color: UIColor.black,
        ),
      ),
    );
  }
}
