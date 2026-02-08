import '../../../design_system.dart';

class BottomSheetManager {
  static Future<T?> showReasonsRejectionBottomSheet<T>(
    BuildContext context, {
    required List<String> reasons,
    required String title,
    required String description,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true, // This shows the sheet above navigation bars
      builder:
          (context) => ReasonsRejectionBottomSheet(
            reasons: reasons,
            title: title,
            description: description,
          ),
    );
  }
}
