import 'package:flutter/material.dart';

class UIColor extends Color {
  const UIColor._(super.value);

  // Primary colors
  static const UIColor primary = UIColor._(0xFFFAB4F0);
  static const UIColor softGreen = UIColor._(0xffD6F0C0);
  static const UIColor softGreen1 = UIColor._(0xffF7FFF1);
  static const UIColor softYellow = UIColor._(0xffF6E7B0);
  static const UIColor babyBlue = UIColor._(0xff9ED6F9);
  static const UIColor softBlue = UIColor._(0xFFF3F6FF);
  static const UIColor babyPink = UIColor._(0xffFFECFC);
  static const UIColor pink = UIColor._(0xffFAB4F0);
  static const UIColor balck = UIColor._(0xFF282828);
  static const UIColor grey = UIColor._(0xff767676);
  static const UIColor softgrey = UIColor._(0xFFECECEC);
  static const UIColor primaryDark = UIColor._(0xFF2B2148);
  static const UIColor secondary = UIColor._(0xFFE3DAFF);
  static const UIColor tertiary = UIColor._(0xFF6ADBDA);
  static const UIColor softOrange = UIColor._(0xFFEBB376);
  static const UIColor orange = UIColor._(0xFFFFAC50);
  static const UIColor successDark = UIColor._(0xFF218A23);
  static const UIColor aqua = UIColor._(0xFF2BD8CB);
  static const UIColor warningStrong = UIColor._(0xFFFF9A2A);
  static const UIColor errorStrong = UIColor._(0xFFFF2A2D);

  // Status colors
  static const UIColor errorLight = UIColor._(0xFFFC5151);
  static const UIColor error = UIColor._(0xFFFF6653);
  static const UIColor errorDark = UIColor._(0xFFC01515);
  static const UIColor success = UIColor._(0xFF32D938);
  static const UIColor successBright = UIColor._(0xFF0FCC5D);
  static const UIColor warning = UIColor._(0xFFFFC155);

  // Neutral colors
  static const UIColor neutral000 = UIColor._(0xFFFFFFFF);
  static const UIColor neutral25 = UIColor._(0xffF6F7F9);
  static const UIColor neutral50 = UIColor._(0xffE3E3E3);
  static const UIColor neutral100 = UIColor._(0xFFF4F4F4);
  static const UIColor neutral150 = UIColor._(0xFFCECECE);
  static const UIColor neutral200 = UIColor._(0xFFC4C4C4);
  static const UIColor neutral300 = UIColor._(0xFFA4A4A4);
  static const UIColor neutral400 = UIColor._(0xFFA5A2AF);
  static const UIColor neutral450 = UIColor._(0xFF898989);
  static const UIColor neutral475 = UIColor._(0xFF6D6D6D);
  static const UIColor neutral480 = UIColor._(0xFF666666);
  static const UIColor neutral500 = UIColor._(0xFF5F5972);
  static const UIColor neutral600 = UIColor._(0xFF6F7485);
  static const UIColor neutral700 = UIColor._(0xFF49454F);
  static const UIColor neutral800 = UIColor._(0xFF212633);
  static const UIColor neutral850 = UIColor._(0xFF231F20);
  static const UIColor neutral900 = UIColor._(0xFF1D1B20);
  static const UIColor neutral950 = UIColor._(0xFF121212);
  static const UIColor neutral975 = UIColor._(0xFF0B0B0B);

  // Background colors
  static const UIColor background = white;
  static const UIColor backgroundInactive = UIColor._(0xFFA5A2AF);
  static const UIColor backgroundResting = UIColor._(0xFFFBFAFF);
  static const UIColor iconsAvaterRed = UIColor._(0xffff0000);
  static const UIColor backgroungAvaterRed = UIColor._(0xff1aff0000);
  static const UIColor backgroungSwitchUnactive = UIColor._(0xffEBEBEB);
  static const UIColor backgroungSilverLight = UIColor._(0xff0DA1A4A7);
  static const UIColor backgroundsilvar = UIColor._(0xff1F787880);

  // Surface colors
  static const UIColor surface = neutral000;
  static const UIColor turshry = UIColor._(0xFFF6F6F6);
  static const UIColor onSurface = neutral500;
  static const UIColor onPrimary = neutral000;

  // Text colors
  static const UIColor textPrimary = primaryDark;
  static const UIColor textSecondary = neutral600;
  static const UIColor textPlaceholder = neutral300;
  static const UIColor textGray = UIColor._(0xffABABAB);
  static const UIColor textNatral600 = UIColor._(0xff717171);
  static const UIColor textSliverLight = UIColor._(0xffDAD8DB);

  // Border colors
  static const UIColor border = softgrey;
  static const UIColor borderFocused = primary;
  static const UIColor borderError = error;
  static const UIColor bordarCard = UIColor._(0xFFD9D9D9);

  /// Shadow color
  static const UIColor shadow = UIColor._(0xFF101828);

  static List<UIColor> get avatars => [primary, warning, tertiary];

  // grey colors
  static const UIColor grey5 = UIColor._(0xFFE9E9ED);

  // white
  static const UIColor white = UIColor._(0xFFFFFFFF);

  // black scale (dark → light)
  static const UIColor black = UIColor._(0xFF000000);
  static const UIColor midnight = UIColor._(0xFF13171B);
  static const UIColor ink = UIColor._(0xFF1B1D21);
  static const UIColor charcoal = UIColor._(0xFF303030);
  static const UIColor graphite = UIColor._(0xFF424242);
  static const UIColor steel = UIColor._(0xFF5E5F60);

  // vivid colors
  static const UIColor vividBlue = UIColor._(0xFF2299DD);
  static const UIColor vividGreen = UIColor._(0xFF4FBF67);
  static const UIColor vividPink = UIColor._(0xFFFF7C9B);

  // divider
  static const UIColor divider = UIColor._(0xFFF5F5F5);
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

  static const List<Color> backgroundGradiant = [
    UIColor.softGreen,
    UIColor.background,
  ];

  static const List<Color> yelloAndPinkGradiant = [
    UIColor.borderFocused,
    UIColor.softYellow,
  ];
}
