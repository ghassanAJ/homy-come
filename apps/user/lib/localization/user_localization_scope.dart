import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:user/localization/files/userTranslation.i69n.dart';
import 'package:util/util.dart';

import 'user_localization_delegate.dart';

class UserLocalizationScope extends SingleChildStatelessWidget {
  const UserLocalizationScope({
    super.key,
    super.child,
    LocalizationsDelegate<UserTranslation>? delegate,
  }) : _delegate = delegate ?? const UserLocalizationDelegate();

  final LocalizationsDelegate<UserTranslation> _delegate;

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return LocalizationProvider<UserTranslation>(
      delegate: _delegate,
      child: child ?? const SizedBox.shrink(),
    );
  }
}
