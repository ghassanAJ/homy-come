import 'dart:developer';

import 'package:design_system/src/tokens/UIFonts.dart';
import 'package:flutter/material.dart';

/// Typography tokens for the design system
///
/// All text styles use Montserrat font family
/// Access via: UI.text.h1(), UI.text.h2(), UI.text.h3()
class UITypography {
  const UITypography();

  static const String _fontFamily = 'Montserrat';

  // ============================================================================
  // HEADINGS
  // ============================================================================

  /// Heading 1
  ///
  /// Size: 32px
  /// Line height: 40px (1.25)
  /// Weight: 700 (Bold)
  ///
  /// Usage: Page titles, main headings
  TextStyle get h1 => const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 1.25,
    letterSpacing: 0,
  );

  /// Heading 2
  ///
  /// Size: 24px
  /// Line height: 32px (1.33)
  /// Weight: 700 (Bold)
  ///
  /// Usage: Section titles, secondary headings
  TextStyle get h2 => const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 1.33,
    letterSpacing: 0,
  );

  /// Heading 3
  ///
  /// Size: 20px
  /// Line height: 28px (1.4)
  /// Weight: 500 (Medium)
  ///
  /// Usage: Subsection titles, card headers
  TextStyle get h3 => const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 0,
  );

  TextStyle get h4 => const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    height: 1.7,
    letterSpacing: 0,
  );

  TextStyle get h5 => const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0,
  );

  TextStyle get h6 => const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    height: 1.4,
    letterSpacing: 0,
  );

  // ============================================================================
  // BODY TEXT
  // ============================================================================

  /// Body Medium - Regular
  ///
  /// Weight: 400 (Regular)
  /// Size: 16px
  /// Line height: 24px (1.5)
  ///
  /// Usage: Primary body text, paragraphs, descriptions
  TextStyle get bodyMedium => const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0,
    decoration: TextDecoration.none,
  );

  TextStyle get bodyMediumRoboto => const TextStyle(
    fontFamily: UIFontFamily.roboto,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0,
    decoration: TextDecoration.none,
  );

  TextStyle get bodyLarge => const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0,
  );

  TextStyle get titleMd => const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.5,
    letterSpacing: 0,
  );

  /// Body Small - Regular
  ///
  /// Weight: 400 (Regular)
  /// Size: 14px
  /// Line height: 20px (1.43)
  ///
  /// Usage: Secondary text, field labels, supporting content
  TextStyle get bodySmall => const TextStyle(
    fontFamily: UIFontFamily.montserrat,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.43,
    letterSpacing: 0,
    overflow: TextOverflow.ellipsis,
  );

  /// Body Small Bold
  ///
  /// Weight: 700 (Bold)
  /// Size: 14px
  /// Line height: 20px (1.43)
  ///
  /// Usage: Secondary text, field labels, supporting content
  TextStyle get bodySmallBold => const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    height: 1.43,
    letterSpacing: 0,
  );

  /// Body Small Bold
  ///
  /// Weight: 700 (Bold)
  /// Size: 14px
  /// Line height: 20px (1.43)
  ///
  /// Usage: Secondary text, field labels, supporting content

  /// Body XSmall - Regular
  ///
  /// Weight: 400 (Regular)
  /// Size: 12px
  /// Line height: 150% (1.5)
  ///
  /// Usage: Small body text, metadata
  TextStyle get bodyXSmall => const TextStyle(
    fontFamily: UIFontFamily.montserrat,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0,
  );

  /// Body XXSmall - Regular
  ///
  /// Weight: 400 (Regular)
  /// Size: 10px
  /// Line height: 150% (1.5)
  ///
  /// Usage: Extra small body text, compact metadata
  TextStyle get bodyXXSmall => const TextStyle(
    fontFamily: UIFontFamily.montserrat,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0,
  );

  TextStyle get headerBody => const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.43,
    letterSpacing: 0,
    overflow: TextOverflow.ellipsis,
  );
  // ============================================================================
  // CAPTION
  // ============================================================================

  /// Caption Small - Regular
  ///
  /// Weight: 400 (Regular)
  /// Size: 12px
  /// Line height: 16px (1.33)
  ///
  /// Usage: Captions, timestamps, helper text, error messages
  TextStyle get caption => const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.33,
    letterSpacing: 0,
  );

  /// Caption Small Bold
  ///
  /// Weight: 700 (Bold)
  /// Size: 12px
  /// Line height: 16px (1.33)
  ///
  /// Usage: Captions, timestamps, helper text, error messages
  TextStyle get captionSmall => const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.33,
    letterSpacing: 0,
  );
  // ============================================================================
  // BUTTON TEXT
  // ============================================================================

  /// Button Medium - SemiBold
  ///
  /// Weight: 600 (SemiBold)
  /// Size: 16px
  /// Line height: 24px (1.5)
  ///
  /// Usage: Primary buttons, secondary buttons, action buttons
  TextStyle get buttonText => const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.5,
    letterSpacing: 0,
  );
  TextStyle get buttonTextXSm => const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.5,
    letterSpacing: 0,
  );

  TextStyle get buttonTextSm => const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.5,
    letterSpacing: 0,
  );

  /// Button with Icon - SemiBold
  ///
  /// Weight: 600 (SemiBold)
  /// Size: 16px
  /// Line height: 24px (1.5)
  ///
  /// Usage: Buttons with icons
  TextStyle get buttonWithIcon => const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.5,
    letterSpacing: 0,
  );

  // ============================================================================
  // INPUT FIELD TEXT
  // ============================================================================

  /// Input Field Placeholder
  ///
  /// Weight: 400 (Regular)
  /// Size: 16px
  /// Line height: 24px (1.5)
  ///
  /// Usage: Text input field placeholders
  TextStyle get inputPlaceholder => const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0,
  );

  /// Input Field Text
  ///
  /// Weight: 400 (Regular)
  /// Size: 16px
  /// Line height: 24px (1.5)
  ///
  /// Usage: Text input field content
  TextStyle get inputText => const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0,
  );

  /// Input Field Error
  ///
  /// Weight: 400 (Regular)
  /// Size: 12px
  /// Line height: 16px (1.33)
  ///
  /// Usage: Error messages below input fields
  TextStyle get inputError => const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.33,
    letterSpacing: 0,
  );

  TextStyle get black512 => const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.33,
    letterSpacing: 0,
  );

  TextStyle get bodyBold => const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    height: 1.33,
    letterSpacing: 0,
  );
  // ============================================================================
  // ALIASES (for convenience)
  // ============================================================================

  /// Alias for field labels (same as bodySmall)
  TextStyle get fieldLabel =>
      bodySmallBold.fontWeight == FontWeight.w600
          ? bodySmallBold
          : bodySmall.copyWith(fontWeight: FontWeight.w600);
}

class UITextScale {
  static double scale(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < 360) return 0.8; // very small phones
    if (width < 400) return 0.9; // small phones
    if (width < 600) return 1.0; // normal phones
    if (width < 900) return 1.05; // tablets
    log('width: $width');
    return 1.1; // large tablets
  }
}
