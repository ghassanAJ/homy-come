

import 'package:design_system/design_system.dart';

class ChoiceChipButton extends StatelessWidget {
  const ChoiceChipButton({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: EdgeInsets.symmetric(
          horizontal: UI.spacing.md,
          vertical: UI.spacing.xs,
        ),
        decoration: BoxDecoration(
          color: selected ? UIColor.babyPink : UIColor.background,
          borderRadius: BorderRadius.circular(20),
          boxShadow: UI.shadows.xs,
        ),
        child: UIText.bodyMedium(
          label,
          fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
          color: selected ? UIColor.pink : UIColor.grey,
        ),
      ),
    );
  }
}
