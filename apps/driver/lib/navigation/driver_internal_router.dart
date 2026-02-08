import 'package:driver/navigation/route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Internal router for driver app navigation.

class DriverInternalRouter {
  final BuildContext context;

  const DriverInternalRouter(this.context);

  void gotoHome() {
    context.go(DriverPaths.home);
  }

  void gotoMyTeam() {
    context.go(DriverPaths.myTeam);
  }

  void gotoProfile() {
    context.go(DriverPaths.profile);
  }

  static DriverInternalRouter of(BuildContext context) {
    return DriverInternalRouter(context);
  }
}
