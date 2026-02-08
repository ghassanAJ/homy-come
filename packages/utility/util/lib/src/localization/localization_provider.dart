import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i69n/i69n.dart';
import 'package:nested/nested.dart';

extension LocalizationExtension on BuildContext {
  T loc<T extends I69nMessageBundle>() {
    return Localizations.of<T>(this, T)!;
  }
}

class LocalizationProvider<T extends I69nMessageBundle>
    extends SingleChildStatelessWidget {
  final LocalizationsDelegate<T> delegate;

  /// When non-null, used as the locale (e.g. at app root when no [Localizations]
  /// ancestor exists). When null, [Localizations.localeOf] is used.
  final Locale? locale;

  const LocalizationProvider({
    super.key,
    required this.delegate,
    this.locale,
    super.child,
  });

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    final resolvedLocale =
        locale ?? Localizations.maybeLocaleOf(context) ?? const Locale('en');

    return Localizations(
      locale: resolvedLocale,
      delegates: [
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate, // Recommended for iOS
      ],
      child: child ?? SizedBox.shrink(),
    );
  }
}
