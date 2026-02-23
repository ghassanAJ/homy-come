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

  /// Common all-sides extra large spacing.
  EdgeInsets get allXl => EdgeInsets.all(_spacing.xl);

  /// Onboarding slider top offset based on screen height (without safe area).
  double onboardingSliderTopOffset({required double screenHeight}) =>
      screenHeight * 0.15;

  /// Onboarding slider top padding based on screen height (without safe area).
  EdgeInsets onboardingSliderTop({required double screenHeight}) =>
      EdgeInsets.only(
        top: onboardingSliderTopOffset(screenHeight: screenHeight),
      );

  /// Onboarding slider footer/actions padding.
  double get onboardingActionsBottomInset => _spacing.xl;

  /// Onboarding slider footer/actions padding.
  EdgeInsetsDirectional get onboardingActions =>
      EdgeInsetsDirectional.fromSTEB(
        _spacing.xxl,
        0,
        _spacing.lg,
        onboardingActionsBottomInset,
      );

  /// Onboarding bottom inset only (used when horizontal inset is managed by parent).
  EdgeInsetsDirectional get onboardingActionsBottomOnly =>
      EdgeInsetsDirectional.only(bottom: onboardingActionsBottomInset);

  /// Onboarding intro content padding with responsive top offset and safe areas.
  EdgeInsets onboardingIntroContent({
    required double screenHeight,
    required double safeTop,
    required double safeBottom,
  }) => EdgeInsets.fromLTRB(
    _spacing.lg,
    safeTop + (screenHeight * 0.08),
    _spacing.lg,
    safeBottom + _spacing.xl,
  );

  /// Onboarding card image horizontal padding.
  EdgeInsets get onboardingCardImageHorizontal =>
      EdgeInsets.symmetric(horizontal: _spacing.xxl + _spacing.xs);

  /// Onboarding card title horizontal padding.
  EdgeInsetsDirectional get onboardingCardTitleHorizontal =>
      EdgeInsetsDirectional.symmetric(horizontal: _spacing.xl);

  /// Onboarding card subtitle horizontal padding.
  EdgeInsetsDirectional get onboardingCardSubtitleHorizontal =>
      EdgeInsetsDirectional.only(
        start: _spacing.xxl + _spacing.xxs,
        end: _spacing.xxl2 + _spacing.xxs,
      );
}
