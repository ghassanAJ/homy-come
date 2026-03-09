import 'package:flutter/widgets.dart';

extension ProfileLanguageLabelExtension on BuildContext {
  String get currentProfileLanguageLabel {
    return switch (Localizations.localeOf(this).languageCode) {
      'ar' => 'العربية',
      _ => 'English',
    };
  }
}
