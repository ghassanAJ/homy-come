import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:util/util.dart';

import 'auth_localization_delegate.dart';
import 'files/authenticationTranslation.i69n.dart';

/// Wraps the route subtree in [LocalizationProvider] so [AuthenticationTranslation]
/// is available via [BuildContext.loc] within auth routes.
class AuthLocalizationScope extends SingleChildStatelessWidget {
  const AuthLocalizationScope({
    super.key,
    super.child,
    LocalizationsDelegate<AuthenticationTranslation>? delegate,
  }) : _delegate = delegate ?? const AuthLocalizationDelegate();

  final LocalizationsDelegate<AuthenticationTranslation> _delegate;

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return LocalizationProvider<AuthenticationTranslation>(
      delegate: _delegate,
      child: child ?? const SizedBox.shrink(),
    );
  }
}
