import 'package:design_system/design_system.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DatePickerHelper {
  DatePickerHelper._();

  /// Shows a themed date picker dialog
  /// Returns the selected date or null if cancelled
  static Future<DateTime?> showThemedDatePicker(
    BuildContext context, {
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    return await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime(2000),
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate ?? DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: UIColor.primary,
              onPrimary: UIColor.white,
              surface: UIColor.black,
              onSurface: UIColor.background,
            ),
          ),
          child: child!,
        );
      },
    );
  }

  static String formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  static Future<void> selectDateForFormField(
    BuildContext context,
    GlobalKey<FormBuilderState> formKey,
    String fieldName, {
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    Function(DateTime)? onDateSelected,
  }) async {
    final picked = await showThemedDatePicker(
      context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked != null) {
      final formattedDate = formatDate(picked);
      formKey.currentState?.fields[fieldName]?.didChange(formattedDate);
      onDateSelected?.call(picked);
    }
  }
}
