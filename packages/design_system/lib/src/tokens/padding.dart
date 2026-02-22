import 'package:flutter/widgets.dart';

import 'spacing.dart';

/// Predefined padding values for common layouts and components.
///
/// Access via: `UI.padding.authScrollable`.
class UIPadding {
  const UIPadding();

  static const _spacing = UISpacing();

  /// Common auth form scrollable area padding.
  EdgeInsets get authScrollable =>
      EdgeInsets.fromLTRB(_spacing.lg, _spacing.xxl, _spacing.lg, _spacing.xl);

  /// Common auth screen footer/actions padding.
  EdgeInsets get authActions =>
      EdgeInsets.fromLTRB(_spacing.xl, _spacing.md, _spacing.xl, _spacing.lg);

  /// Common horizontal medium spacing.
  EdgeInsets get horizontalMd => EdgeInsets.symmetric(horizontal: _spacing.md);

  /// Common horizontal large spacing.
  EdgeInsets get horizontalLg => EdgeInsets.symmetric(horizontal: _spacing.lg);
}
