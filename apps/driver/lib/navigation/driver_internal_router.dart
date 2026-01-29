import 'package:driver/navigation/route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Internal router for driver app navigation.
class DriverInternalRouter {
  final BuildContext context;

  const DriverInternalRouter(this.context);

  void goBack() {
    context.pop();
  }

  void toHome() {
    context.go(DriverPaths.home);
  }

  void toMyTeam() {
    context.go(DriverPaths.myTeam);
  }

  void toProfile() {
    context.go(DriverPaths.profile);
  }

  static DriverInternalRouter of(BuildContext context) {
    return DriverInternalRouter(context);
  }
}
