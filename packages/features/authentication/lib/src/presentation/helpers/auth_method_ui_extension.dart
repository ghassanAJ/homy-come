import 'package:authentication/src/domain/enums/auth_method.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

extension AuthMethodUIExtension on AuthMethod {
  String get label {
    switch (this) {
      case AuthMethod.pin:
        return 'PIN';
      case AuthMethod.email:
        return 'Email';
      case AuthMethod.phone:
        return 'Phone';
      case AuthMethod.google:
        return 'Google';
      case AuthMethod.apple:
        return 'Apple';
    }
  }

  IconData? get icon {
    switch (this) {
      case AuthMethod.pin:
        return IconsaxPlusLinear.lock;
      case AuthMethod.email:
        return IconsaxPlusLinear.sms;
      case AuthMethod.phone:
        return IconsaxPlusLinear.mobile;
      case AuthMethod.google:
      case AuthMethod.apple:
        return null;
    }
  }

  String? get svgAsset {
    switch (this) {
      case AuthMethod.google:
        return 'assets/google.svg';
      case AuthMethod.apple:
        return 'assets/apple.svg';
      default:
        return null;
    }
  }
}
