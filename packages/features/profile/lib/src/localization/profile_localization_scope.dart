import 'package:flutter/material.dart';

import 'profile_localization_delegate.dart';
import 'files/ProfileTranslation.i69n.dart';

extension ProfileTranslationExtension on BuildContext {
  ProfileTranslation get profileTranslation => ProfileTranslationExtension.loc(this);

  static ProfileTranslation loc(BuildContext context) {
    return Localizations.of<ProfileTranslation>(
      context,
      ProfileTranslation,
    )!;
  }
}

/// Provides [ProfileTranslation] to descendants
class ProfileLocalizationScope extends StatelessWidget {
  const ProfileLocalizationScope({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      context: context,
      delegates: const [
        ProfileLocalizationDelegate(),
      ],
      child: child,
    );
  }
}