import 'package:design_system/design_system.dart';

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

  /// Common all-sides medium spacing.
  EdgeInsets get allMd => EdgeInsets.all(_spacing.md);

  /// Common horizontal large spacing.
  EdgeInsets get horizontalLg => EdgeInsets.symmetric(horizontal: _spacing.lg);

  /// Common vertical small spacing.
  EdgeInsets get verticalSm => EdgeInsets.symmetric(vertical: _spacing.sm);

  /// Common bottom medium spacing.
  EdgeInsets get bottomMd => EdgeInsets.only(bottom: _spacing.md);

  /// Common compact chip padding.
  EdgeInsets get chipCompact =>
      EdgeInsets.symmetric(horizontal: _spacing.xs, vertical: _spacing.xxs);

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
  EdgeInsetsDirectional get onboardingActions => EdgeInsetsDirectional.fromSTEB(
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

  /// User home screen content padding inside scroll area.
  EdgeInsetsDirectional userHomeContent({required double bottomInset}) =>
      EdgeInsetsDirectional.only(
        top: _spacing.xl,
        start: _spacing.lg,
        bottom: bottomInset,
      );

  /// User home horizontal list item end spacing.
  EdgeInsetsDirectional get userHomeItemEnd =>
      EdgeInsetsDirectional.only(end: _spacing.md);

  /// User home horizontal list item end spacing with extra offset.
  EdgeInsetsDirectional get userHomeItemEndWithXxs =>
      EdgeInsetsDirectional.only(end: _spacing.md + _spacing.xxs);

  /// User home section action end spacing.
  EdgeInsetsDirectional get userHomeSectionActionEnd =>
      EdgeInsetsDirectional.only(end: _spacing.md);

  /// User home story offer card content padding.
  EdgeInsets get userHomeStoryOfferCardContent => EdgeInsets.all(_spacing.sm);

  /// User home service offer tile content padding.
  EdgeInsets get userHomeServiceOfferTileContent => EdgeInsets.all(_spacing.sm);

  /// User home header actions container margin.
  EdgeInsetsDirectional get userHomeHeaderActionsMargin =>
      EdgeInsetsDirectional.only(end: _spacing.xs);

  /// User home header actions container inner padding.
  EdgeInsets get userHomeHeaderActionsPadding =>
      EdgeInsets.symmetric(horizontal: _spacing.sm, vertical: _spacing.xs);

  /// User search top section padding (search + popular search).
  EdgeInsetsDirectional get userSearchTopSectionContent =>
      EdgeInsetsDirectional.only(
        start: _spacing.xl,
        top: _spacing.md,
        end: _spacing.xl,
      );

  /// User search bottom section padding (top services + apply button).
  EdgeInsetsDirectional userSearchBottomSectionContent({
    required double bottomInset,
    double? endInset,
  }) => EdgeInsetsDirectional.only(
    start: _spacing.lg,
    top: _spacing.lg,
    end: endInset ?? _spacing.lg,
    bottom: bottomInset,
  );

  /// User search field content padding.
  EdgeInsets get userSearchFieldContent =>
      EdgeInsets.symmetric(horizontal: _spacing.md, vertical: _spacing.xxs);

  /// User search chip content padding.
  EdgeInsets get userSearchChipContent =>
      EdgeInsets.symmetric(horizontal: _spacing.sm, vertical: _spacing.xs);

  /// User home horizontal list item spacing
  /// - First item has start spacing
  /// - All items have end spacing
  EdgeInsetsDirectional userHomeItemStartAndEnd({required bool isFirst}) =>
      EdgeInsetsDirectional.only(
        start: isFirst ? _spacing.lg : 0,
        end: _spacing.md,
      );

  /// User home screen vertical padding (top + bottom only).
  EdgeInsetsDirectional userHomeContentVertical({
    required double bottomInset,
  }) => EdgeInsetsDirectional.only(top: _spacing.xl, bottom: bottomInset);

  EdgeInsetsDirectional get startLg =>
      EdgeInsetsDirectional.only(start: _spacing.lg);

  /// Notifications screen scroll content padding.
  EdgeInsetsDirectional get notificationsContent => EdgeInsetsDirectional.only(
    start: _spacing.lg + _spacing.xxs,
    end: _spacing.lg,
    top: _spacing.xs,
    bottom: _spacing.xl,
  );

  /// Notifications section spacing.
  EdgeInsetsDirectional notificationsSectionSpacing({required bool isLast}) =>
      EdgeInsetsDirectional.only(
        bottom: isLast ? 0 : _spacing.lg + _spacing.xxs,
      );

  /// Notifications item spacing.
  EdgeInsetsDirectional notificationsItemSpacing({required bool isLast}) =>
      EdgeInsetsDirectional.only(bottom: isLast ? 0 : _spacing.sm);

  /// Notifications card content padding.
  EdgeInsetsDirectional get notificationsCardContent =>
      EdgeInsetsDirectional.symmetric(
        horizontal: _spacing.md,
        vertical: _spacing.xs,
      );

  /// Notifications shimmer card content padding.
  EdgeInsetsDirectional get notificationsShimmerCardContent =>
      EdgeInsetsDirectional.symmetric(
        horizontal: _spacing.md,
        vertical: _spacing.md,
      );

  /// Driver profile screen top content padding.
  EdgeInsets driverProfileContent({required double topInset}) =>
      EdgeInsets.fromLTRB(
        _spacing.sm,
        topInset,
        _spacing.sm,
        UI.sizes.bottomNavigationBarHeight,
      );

  /// Driver profile settings screen content padding.
  EdgeInsets driverProfileSettingsContent({required double topInset}) =>
      EdgeInsets.fromLTRB(_spacing.sm, topInset, _spacing.sm, _spacing.lg);

  /// Driver profile "Settings" card content padding.
  EdgeInsets get driverProfileSettingsCardContent =>
      EdgeInsets.symmetric(vertical: _spacing.md);

  /// Driver profile header card content padding.
  EdgeInsets get driverProfileHeaderContent =>
      EdgeInsets.symmetric(horizontal: _spacing.xl, vertical: _spacing.md);

  /// Driver profile edit button vertical padding.
  EdgeInsets get driverProfileHeaderEditButtonContent =>
      EdgeInsets.symmetric(vertical: _spacing.xs);

  /// Driver profile performance card content padding.
  EdgeInsets get driverProfilePerformanceCardContent =>
      EdgeInsets.all(_spacing.lg);

  /// Driver profile performance legend horizontal padding.
  EdgeInsets get driverProfilePerformanceLegendHorizontal =>
      EdgeInsets.symmetric(horizontal: _spacing.lg);

  /// Driver profile settings row horizontal padding.
  EdgeInsets get driverProfileSettingsRowContent =>
      EdgeInsets.symmetric(horizontal: _spacing.xl);

  /// Profile static info screen content padding.
  EdgeInsets profileInfoScreenContent({required double topInset}) =>
      EdgeInsets.fromLTRB(_spacing.lg, topInset, _spacing.md, _spacing.lg);

  /// Profile help/support sliver app bar divider padding.
  EdgeInsets get profileSupportAppBarDivider =>
      EdgeInsets.only(left: _spacing.xl, top: _spacing.md);

  /// Profile help/support body content padding.
  EdgeInsets get profileSupportContent =>
      EdgeInsets.fromLTRB(_spacing.lg, _spacing.md, _spacing.md, 0);

  /// Profile settings/more card content padding.
  EdgeInsets get profileOptionsCardContent =>
      EdgeInsets.symmetric(horizontal: _spacing.lg, vertical: _spacing.md);

  /// User profile info card content padding.
  EdgeInsets get profileUserInfoContent =>
      EdgeInsets.symmetric(horizontal: _spacing.md, vertical: _spacing.sm);

  /// User profile info camera badge content padding.
  EdgeInsets get profileUserInfoCameraBadgeContent =>
      EdgeInsets.all(_spacing.xxs);

  /// Profile setting option tile bottom spacing.
  EdgeInsets get profileSettingOptionContentPadding =>
      EdgeInsets.only(bottom: _spacing.sm);

  /// Profile setting option trailing end padding.
  EdgeInsetsDirectional get profileSettingOptionTrailingEnd =>
      EdgeInsetsDirectional.only(end: _spacing.xs);

  /// Profile setting option icon content padding.
  EdgeInsets get profileSettingOptionIconContent =>
      EdgeInsets.all(UI.sizes.iconXXs);

  /// Rating and reviews "show more" action padding.
  EdgeInsets get profileRatingAndReviewsShowMoreContent =>
      EdgeInsets.symmetric(horizontal: _spacing.sm, vertical: _spacing.xxs);

  /// Rating and reviews row spacing.
  EdgeInsets get profileRatingAndReviewsRowSpacing =>
      EdgeInsets.only(bottom: _spacing.md);

  /// Provider all reviews list content padding.
  EdgeInsets profileAllReviewsContent({required double topInset}) =>
      EdgeInsets.only(top: topInset, left: _spacing.lg, right: _spacing.lg);
}
