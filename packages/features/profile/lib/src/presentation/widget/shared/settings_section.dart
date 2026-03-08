import 'package:design_system/design_system.dart';
import 'package:profile/src/presentation/widget/shared/settings_row.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({
    super.key,
    required this.title,
    this.onTap,
  });

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return UICardContainer(
      width: double.infinity,
      padding: UI.padding.driverProfileSettingsCardContent,
      child: SettingsRow(
        onTap: onTap,
        title: title,
        titleBuilder:
            (title, color) => UIText.bodySmall(
              title,
              color: color,
              fontWeight: FontWeight.w600,
            ),
        showDivider: false,
      ),
    );
  }
}
