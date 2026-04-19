import 'package:design_system/design_system.dart';

class TimeSlotChip extends StatelessWidget {
  const TimeSlotChip({
    required this.label,
    required this.selected,
    required this.enabled,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final wid = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        width: wid * 0.28,
        padding: EdgeInsets.symmetric(vertical: UI.spacing.xs),
        decoration: BoxDecoration(
          color:
              selected
                  ? UIColor.pink.withValues(alpha: .22)
                  : UIColor.background,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color:
                selected
                    ? UIColor.primary.withValues(alpha: .5)
                    : UIColor.neutral50,
          ),
        ),
        alignment: Alignment.center,
        child: UIText.bodySmall(
          label,
          color: enabled ? UIColor.black : UIColor.neutral300,
          fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
        ),
      ),
    );
  }
}
