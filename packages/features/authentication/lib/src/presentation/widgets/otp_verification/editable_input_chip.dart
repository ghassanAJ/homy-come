import 'package:design_system/design_system.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

/// Editable input chip widget that displays a value with an edit icon
///
/// Used in OTP verification screen to show and allow editing of
/// the email/phone number where OTP was sent
class EditableInputChip extends StatelessWidget {
  final String value;
  final VoidCallback onEdit;

  const EditableInputChip({
    super.key,
    required this.value,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onEdit,
      child: Container(
        padding: UI.padding.chipCompact,
        decoration: BoxDecoration(
          color: UIColor.white,
          borderRadius: BorderRadius.circular(UI.radius.lg),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            UIText.bodySmall(value),
            SizedBox(width: UI.spacing.xs),
            Icon(
              IconsaxPlusLinear.edit_2,
              size: UI.sizes.iconXs,
              color: UIColor.tertiary,
            ),
          ],
        ),
      ),
    );
  }
}
