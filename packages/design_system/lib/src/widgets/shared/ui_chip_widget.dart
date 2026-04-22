import 'package:design_system/design_system.dart';

class UIChipWidget extends StatelessWidget {
  const UIChipWidget({
    required this.title,
    required this.isSelected,
    required this.onTap,
    this.selectedBackgroundColor,
    this.borderColor,
    super.key,
  });

  final String title;
  final UIColor? selectedBackgroundColor;
  final UIColor? borderColor;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: UI.padding.userSearchChipContent,
        decoration: BoxDecoration(
          color:
              isSelected
                  ? selectedBackgroundColor ?? UIColor.white
                  : UIColor.white,
          borderRadius: BorderRadius.circular(UI.radius.full),
          border: Border.all(
            color:
                isSelected
                    ? borderColor ?? UIColor.neutral100.withValues(alpha: 0.3)
                    : UIColor.neutral100.withValues(alpha: 0.9),
            width: 1,
          ),
        ),
        child: UIText.bodyMedium(
          title,
          color: isSelected ? UIColor.primary : UIColor.grey,
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
        ),
      ),
    );
  }
}
