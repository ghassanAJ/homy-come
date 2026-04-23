import '../../../design_system.dart';
import '../../localization/files/DesignSystemTranslation.i69n.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  const DeleteConfirmationDialog({
    super.key,
    required this.title,
    required this.description,
    this.confirmButtonLabel,
    this.cancelButtonLabel,
    this.iconColor,
  });
  final String title;
  final String description;
  final String? confirmButtonLabel;
  final String? cancelButtonLabel;
  final UIColor? iconColor;

  @override
  Widget build(BuildContext context) {
    final translation = Localizations.of<DesignSystemTranslation>(
      context,
      DesignSystemTranslation,
    );
    final confirmLabel =
        confirmButtonLabel ?? translation?.dialog.confirm ?? 'Confirm';
    final cancelLabel =
        cancelButtonLabel ?? translation?.dialog.cancel ?? 'Cancel';

    return AlertDialog(
      // contentPadding: EdgeInsets.all(2),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: iconColor ?? UIColor.error.withOpacity(0.2),
              borderRadius: BorderRadius.circular(100),
            ),
            child: UISvg(Assets.icons.warning),
          ),
          const SizedBox(height: 16),
          UIText.h3(title, textAlign: TextAlign.center),
          const SizedBox(height: 8),
          UIText.caption(description, textAlign: TextAlign.center),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: UIColor.grey5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () => Navigator.of(context).pop(true),
              child: UIText.bodyMedium(confirmLabel, color: UIColor.error),
            ),
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: UIColor.grey5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () => Navigator.of(context).pop(false),
              child: UIText.bodyMedium(cancelLabel, color: UIColor.primaryDark),
            ),
          ),
        ],
      ),
    );
  }
}
