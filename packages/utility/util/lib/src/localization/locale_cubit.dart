import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:util/util.dart';

class LocalizationCubit extends Cubit<Locale> {
  LocalizationCubit() : super(Config.getDeviceLocale());

  void setLocale(Locale locale) {
    if (Config.supportedLocales.any(
      (l) => l.languageCode == locale.languageCode,
    )) {
      emit(locale);
    }
  }

  void toggleLanguage() {
    final next =
        state.languageCode == 'en' ? const Locale('ar') : const Locale('en');
    emit(next);
  }
}
