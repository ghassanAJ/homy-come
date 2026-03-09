import 'package:design_system/src/tokens/UIFonts.dart';
import 'package:flutter/material.dart';

import '../../tokens/colors.dart';
import '../../tokens/typography.dart';

/// Custom Text widget that enforces the design system typography.
///
/// Only allows using predefined text styles from the typography system.
/// Use named constructors to select the appropriate style.
///
/// Example:
/// ```dart
/// UIText.h1('Page Title')
/// UIText.bodyMedium('Content text', color: UIColor.textSecondary)
/// UIText.caption('Helper text', maxLines: 2, overflow: TextOverflow.ellipsis)
/// ```
class UIText extends StatelessWidget {
  final String data;
  final TextStyle style;
  final UIColor? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? softWrap;

  static const _typography = UITypography();

  // ===========================================================================
  // HEADINGS
  // ===========================================================================

  /// Heading 1 - Page titles, main headings
  ///
  /// Size: 30px, Weight: 700 (Bold)
  UIText.h1(
    this.data, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    super.key,
  }) : style = _typography.h1;

  /// Heading 2 - Section titles, secondary headings
  ///
  /// Size: 24px, Weight: 700 (Bold)
  UIText.h2(
    this.data, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    super.key,
  }) : style = _typography.h2;

  /// Heading 3 - Subsection titles, card headers
  ///
  /// Size: 20px, Weight: 500 (Medium)
  UIText.h3(
    this.data, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    super.key,
  }) : style = _typography.h3;

  UIText.h4(
    this.data, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    double? fontSize,
    super.key,
  }) : style = _typography.h4.copyWith(
    fontSize: fontSize
  );

  UIText.h5(
    this.data, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    super.key,
  }) : style = _typography.h5;

  UIText.h6(
    this.data, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    FontWeight? fontWeight,
    double? fontSize,

    super.key,
  }) : style = _typography.h6.copyWith(
         fontWeight: fontWeight,
         fontSize: fontSize,
       );

  // ===========================================================================
  // BODY TEXT
  // ===========================================================================

  /// Body Medium - Primary body text, paragraphs, descriptions
  ///
  /// Size: 16px, Weight: 400 (Regular)
  UIText.bodyMedium(
    this.data, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    FontWeight? fontWeight,
    double? fontSize,
    String? fontFamily,
    super.key,
  }) : style = _typography.bodyMedium.copyWith(
         fontWeight: fontWeight,
         fontSize: fontSize,
         fontFamily: fontFamily,
       );

  UIText.bodyMediumRoboto(
    this.data, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    FontWeight? fontWeight,
    double? fontSize,
    super.key,
  }) : style = _typography.bodyMedium.copyWith(
         fontWeight: fontWeight,
         fontSize: fontSize,
       );

  UIText.bodyLarge(
    this.data, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    FontWeight? fontWeight,
    super.key,
  }) : style = _typography.bodyLarge.copyWith(fontWeight: fontWeight);

  /// Body Small - Secondary text, field labels, supporting content
  ///
  /// Size: 14px, Weight: 400 (Regular)
  UIText.bodySmall(
    this.data, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    FontWeight? fontWeight,
    double? fontSize,
    String? fontFamily,
    super.key,
  }) : style = _typography.bodySmall.copyWith(
         fontWeight: fontWeight,
         fontSize: fontSize,
         fontFamily: fontFamily,
       );

  UIText.bodySmallBold(
    this.data, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    FontWeight? fontWeight,
    double? fontSize,
    super.key,
  }) : style = _typography.bodySmallBold;

  /// Body XSmall - Small body text, metadata
  ///
  /// Size: 12px, Weight: 400 (Regular)
  UIText.bodyXSmall(
    this.data, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    FontWeight? fontWeight,
    String? fontFamily,

    super.key,
  }) : style = _typography.bodyXSmall.copyWith(
         fontWeight: fontWeight,
         fontFamily: fontFamily,
       );

  /// Body XXSmall - Extra small body text, compact metadata
  ///
  /// Size: 10px, Weight: 400 (Regular)
  UIText.bodyXXSmall(
    this.data, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    FontWeight? fontWeight,
    String? fontFamily,
    super.key,
  }) : style = _typography.bodyXXSmall.copyWith(
         fontWeight: fontWeight,
         fontFamily: fontFamily,
       );

  UIText.headerBody(
    this.data, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    FontWeight? fontWeight,
    String? fontFamily,
    super.key,
  }) : style = _typography.headerBody.copyWith(
         fontWeight: fontWeight,
         fontFamily: fontFamily,
       );

  // ===========================================================================
  // CAPTION
  // ===========================================================================

  /// Caption - Captions, timestamps, helper text, error messages
  ///
  /// Size: 12px, Weight: 400 (Regular)
  UIText.caption(
    this.data, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    super.key,
  }) : style = _typography.caption;

  UIText.captionSmall(
    this.data, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    super.key,
  }) : style = _typography.captionSmall;
  // ===========================================================================
  // BUTTON TEXT
  // ===========================================================================

  /// Button Text - Primary buttons, secondary buttons, action buttons
  ///
  /// Size: 16px, Weight: 600 (SemiBold)
  UIText.buttonText(
    this.data, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    FontWeight? fontWeight,
    double? fontSize,
    super.key,
  }) : style = _typography.buttonText.copyWith(
         fontWeight: fontWeight,
         fontSize: fontSize,
       );

  UIText.buttonTextsm(
    this.data, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    FontWeight? fontWeight,
    double? fontSize,
    super.key,
  }) : style = _typography.buttonTextSm.copyWith(
         fontWeight: fontWeight,
         fontSize: fontSize,
       );

 UIText.titleMd(
    this.data, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    FontWeight? fontWeight,
    double? fontSize,
    super.key,
  }) : style = _typography.titleMd.copyWith(
         fontWeight: fontWeight,
         fontSize: fontSize,
       );

    UIText.buttonTextXsm(
    this.data, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    FontWeight? fontWeight,
    double? fontSize,
    super.key,
  }) : style = _typography.buttonTextXSm.copyWith(
         fontWeight: fontWeight,
         fontSize: fontSize,
       );

  /// Button with Icon - Buttons with icons
  ///
  /// Size: 16px, Weight: 600 (SemiBold)
  UIText.buttonWithIcon(
    this.data, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    super.key,
  }) : style = _typography.buttonWithIcon;

  UIText.bodyBold(
    this.data, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    String? fontFamily,
    super.key,
  }) : style = _typography.bodyBold.copyWith(
fontFamily: fontFamily
  );



  UIText.labelCircleProgerss(
    this.data, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    String? fontFamily,
    super.key,
  }) : style = _typography.labelCircleProgress.copyWith(fontFamily: fontFamily);
  // ===========================================================================
  // INPUT FIELD TEXT
  // ===========================================================================

  /// Input Placeholder - Text input field placeholders
  ///
  /// Size: 16px, Weight: 400 (Regular)
  UIText.inputPlaceholder(
    this.data, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    super.key,
  }) : style = _typography.inputPlaceholder;

  /// Input Text - Text input field content
  ///
  /// Size: 16px, Weight: 400 (Regular)
  UIText.inputText(
    this.data, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    super.key,
  }) : style = _typography.inputText;

  /// Input Error - Error messages below input fields
  ///
  /// Size: 12px, Weight: 400 (Regular)
  UIText.inputError(
    this.data, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    super.key,
  }) : style = _typography.inputError;

  /// Field Label - Field labels (alias for bodySmall)
  ///
  /// Size: 14px, Weight: 400 (Regular)
  UIText.fieldLabel(
    this.data, {
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    super.key,
  }) : style = _typography.fieldLabel;

  @override
  Widget build(BuildContext context) {
    final mediaScale = MediaQuery.textScaleFactorOf(context).clamp(1.0, 1.2);

    final scale = UITextScale.scale(context) * mediaScale;

    TextStyle effectiveStyle = style.copyWith(
      fontSize: style.fontSize != null ? style.fontSize! * scale : null,
    );

    // Apply color override if provided
    if (color != null) {
      effectiveStyle = style.copyWith(color: color);
    }

    return Text(
      data,
      style: effectiveStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
    );
  }
}
