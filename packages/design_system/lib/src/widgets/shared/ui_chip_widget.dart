import 'package:design_system/design_system.dart';

class UIChipWidget extends StatelessWidget {
  const UIChipWidget({
    required this.title,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: UI.padding.userSearchChipContent,
        decoration: BoxDecoration(
          color: UIColor.white,
          borderRadius: BorderRadius.circular(UI.radius.full),
          border: Border.all(
            color:
                isSelected
                    ? UIColor.neutral100.withValues(alpha: 0.3)
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
