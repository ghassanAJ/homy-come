import 'package:flutter/material.dart';

class UIColor extends Color {
  const UIColor._(super.value);

  // Primary colors
  static const UIColor primary = UIColor._(0xFFFAB4F0);
  static const UIColor softGreen = UIColor._(0xffD6F0C0);
  static const UIColor softGreen1 = UIColor._(0xffF7FFF1);
  static const UIColor softYellow = UIColor._(0xffF6E7B0);
  static const UIColor babyBlue = UIColor._(0xff9ED6F9);
  static const UIColor babyPink = UIColor._(0xFFFAB4F0);
  static const UIColor balck = UIColor._(0xFF282828);
  static const UIColor grey = UIColor._(0xff767676);
  static const UIColor primaryDark = UIColor._(0xFF2B2148);
  static const UIColor secondary = UIColor._(0xFFE3DAFF);
  static const UIColor tertiary = UIColor._(0xFF6ADBDA);

  // Status colors
  static const UIColor error = UIColor._(0xFFFF6653);
  static const UIColor success = UIColor._(0xFF32D938);
  static const UIColor warning = UIColor._(0xFFFFC155);

  // Neutral colors
  static const UIColor neutral000 = UIColor._(0xFFFFFFFF);
  static const UIColor neutral25 = UIColor._(0xffF6F7F9);
  // static const UIColor neutral100 = UIColor._(0xFFFFFFFF);

  static const UIColor neutral200 = UIColor._(0xFFE2E0E9);
  static const UIColor neutral400 = UIColor._(0xFFA5A2AF);
  static const UIColor neutral500 = UIColor._(0xFF5F5972);

  // Background colors
  static const UIColor background = white;
  static const UIColor backgroundInactive = UIColor._(0xFFA5A2AF);
  static const UIColor backgroundResting = UIColor._(0xFFFBFAFF);

  // Surface colors
  static const UIColor surface = neutral000;
  static const UIColor turshry = UIColor._(0xFFF6F6F6);
  static const UIColor onSurface = neutral500;
  static const UIColor onPrimary = neutral000;

  // Text colors
  static const UIColor textPrimary = primaryDark;
  static const UIColor textSecondary = neutral500;
  static const UIColor textPlaceholder = neutral400;

  // Border colors
  static const UIColor border = neutral200;
  static const UIColor borderFocused = primary;
  static const UIColor borderError = error;

  /// Shadow color - used for drop shadows
  static const UIColor shadow = UIColor._(0xFF101828);

  static List<UIColor> get avatars => [primary, warning, tertiary];

  // grey colors
  static const UIColor grey5 = UIColor._(0xFFE9E9ED);

  // white
  static const UIColor white = UIColor._(0xFFFFFFFF);

  // black
  static const UIColor black = UIColor._(0xFF000000);
}

class UIPieChartColors {
  static const List<Color> colors = [
    UIColor.warning,
    UIColor.primary,
    UIColor.tertiary,
    UIColor.error,
    UIColor.secondary,

    UIColor.success,
    Color(0xff9B8FF5),
    Color(0xffFF9ECD),
    Color(0xff6ADBDA),
    UIColor.success,
    Color(0xffFFA726),
  ];
}

class UIColorGradient {
  static const List<Color> spendingOverview = [
    Color(0xffFFFAF1),
    Color(0xffF5EBFF),
  ];
  static const List<Color> savingInRowLabel = [
    Color(0xffFFF3DF),
    Color(0xffE3DFFF),
  ];
}
