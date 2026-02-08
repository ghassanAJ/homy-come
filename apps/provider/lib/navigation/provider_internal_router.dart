import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homy_provider/navigation/route.dart';

/// Internal router for provider app navigation.
class ProviderInternalRouter {
  final BuildContext context;

  const ProviderInternalRouter(this.context);

  void goBack() {
    context.pop();
  }

  void toHome() {
    context.go(ProviderPaths.home);
  }

  void toServices() {
    context.go(ProviderPaths.services);
  }

  void toBookings() {
    context.go(ProviderPaths.bookings);
  }

  void toProfile() {
    context.go(ProviderPaths.profile);
  }

  void toSettings() {
    context.push(ProviderPaths.settings);
  }

  static ProviderInternalRouter of(BuildContext context) {
    return ProviderInternalRouter(context);
  }
}
