import 'package:flutter/material.dart';
import 'package:homy_provider/localization/files/providerTr.i69n.dart';
import 'package:homy_provider/localization/provider_localization_delegate.dart';
import 'package:nested/nested.dart';
import 'package:util/util.dart';


/// Wraps the route subtree in [LocalizationProvider] so [ProviderTr]
/// is available via [BuildContext.loc] within auth routes.
class ProviderLocalizationScope extends SingleChildStatelessWidget {
  const ProviderLocalizationScope({
    super.key,
    super.child,
    LocalizationsDelegate<ProviderTr>? delegate,
  }) : _delegate = delegate ?? const ProviderLocalizationDelegate();

  final LocalizationsDelegate<ProviderTr> _delegate;

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return LocalizationProvider<ProviderTr>(
      delegate: _delegate,
      child: child ?? const SizedBox.shrink(),
    );
  }
}
