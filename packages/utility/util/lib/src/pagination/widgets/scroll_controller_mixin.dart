import 'package:flutter/widgets.dart';
import 'package:util/src/pagination/widgets/base_paginated_view.dart';
import 'package:util/util.dart';

/// Mixin that provides shared scroll controller management for paginated views.
///
/// This mixin handles the lifecycle of internal and external scroll controllers,
/// ensuring proper disposal and providing a unified interface for accessing
/// the effective controller.
mixin ScrollControllerManagement<T, P extends PaginationParams>
    on BasePaginationViewState<T, P> {
  ScrollController? _internalController;

  /// Override this to provide an external scroll controller.
  ScrollController? get providedController;

  /// Returns the effective scroll controller (external or internal).
  ScrollController get effectiveController {
    return providedController ?? _internalController!;
  }

  @override
  void initState() {
    super.initState();
    if (providedController == null) {
      _internalController = ScrollController();
    }
  }

  @override
  void dispose() {
    _internalController?.dispose();
    super.dispose();
  }
}
