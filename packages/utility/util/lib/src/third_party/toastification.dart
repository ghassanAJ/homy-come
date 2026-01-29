import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class MDToastificationWrapper extends ToastificationWrapper {
  const MDToastificationWrapper({super.key, required super.child});
}

class ToastificationUtil {
  // static ToastificationItem showCustom({
  //   required BuildContext context,
  //   required AlignmentGeometry alignment,
  //   required ToastificationBuilder builder,
  //   ToastificationAnimationBuilder? animationBuilder,
  //   Duration? animationDuration,
  //   Duration? autoCloseDuration,
  // }) {
  //   return Toastification().showCustom(
  //     context: context,
  //     alignment: alignment,
  //     builder: builder,
  //     animationBuilder: animationBuilder,
  //     animationDuration: animationDuration,
  //     autoCloseDuration: autoCloseDuration,
  //   );
  // }

  static ToastificationItem show({
    // required BuildContext context,
    required AlignmentGeometry alignment,
    required MDToastType type,
    required Widget title,
    Widget? description,
    ToastificationAnimationBuilder? animationBuilder,
    Duration? animationDuration,
    Duration? autoCloseDuration,
  }) {
    dismissAll();
    return Toastification().show(
      // context: context,
      alignment: alignment,
      type: fromMddToastType(type),
      title: title,
      description: description,
      animationBuilder: animationBuilder,
      animationDuration: animationDuration,
      autoCloseDuration: autoCloseDuration,
    );
  }

  static void error([String? message]) {
    Toastification().dismissAll(); //
    show(
      alignment: Alignment.topCenter,
      type: MDToastType.error,
      title: Text(message ?? 'Something went wrong'),
      autoCloseDuration: const Duration(seconds: 2),
    );
  }

  static void success(String? message) {
    show(
      alignment: Alignment.topCenter,
      type: MDToastType.success,
      title: Text(message ?? 'Success'),
      autoCloseDuration: const Duration(seconds: 2),
    );
  }

  static void dismissAll() {
    Toastification().dismissAll();
  }

  static void dismissById(String id, {bool showRemoveAnimation = true}) {
    Toastification().dismissById(id, showRemoveAnimation: showRemoveAnimation);
  }
}

ToastificationType fromMddToastType(MDToastType type) {
  switch (type) {
    case MDToastType.error:
      return ToastificationType.error;
    case MDToastType.success:
      return ToastificationType.success;
  }
}

enum MDToastType { error, success }
