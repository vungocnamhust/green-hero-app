import 'package:flutter/material.dart';
import 'package:learning_vietnamese/core/Constant/COLOR_CONST.dart';

class ThemeLV {
  static ThemeData light = ThemeData(
    fontFamily: "Baomoi", //GoogleFonts.mPlusRounded1c().fontFamily,// GoogleFonts.montserrat().fontFamily,
    primaryColor: COLOR_CONST.light_primary,
    accentColor: COLOR_CONST.light_accent,
    backgroundColor: COLOR_CONST.light_background,
    scaffoldBackgroundColor: COLOR_CONST.light_background,
    canvasColor: COLOR_CONST.light_background,
    textTheme: TextTheme(
      headline4: TextStyle(
        fontSize: 34,
        height: 1.3,
        fontWeight: FontWeight.bold,
        color: COLOR_CONST.light_headline6,
      ),
      headline5: TextStyle(
        fontSize: 24,
        height: 1.3,
        fontWeight: FontWeight.bold,
        color: COLOR_CONST.light_headline6,
      ),
      headline6: TextStyle(
        fontSize: 20,
        height: 1.3,
        fontWeight: FontWeight.bold,
        color: COLOR_CONST.light_headline6,
      ),
      bodyText2: TextStyle(
        fontSize: 14,
        height: 1.3,
        color: COLOR_CONST.light_bodyText2,
      ),
    ),
    navigationRailTheme: NavigationRailThemeData(
      elevation: 20.0,
      backgroundColor: COLOR_CONST.light_learn_background, // COLOR_CONST.light_background,
      unselectedIconTheme: IconThemeData(
        color: COLOR_CONST.light_primary,
        size: 40,
        opacity: 1.0,
      ),
      selectedIconTheme: IconThemeData(
        color: COLOR_CONST.light_accent,
        size: 40,
      ),
      unselectedLabelTextStyle: TextStyle(
        color: COLOR_CONST.light_primary,
        fontSize: 18,
      ),
      selectedLabelTextStyle: TextStyle(
        color: COLOR_CONST.light_accent,
        fontSize: 18,
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: Colors.black,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: COLOR_CONST.light_learn_background,
      titleTextStyle: TextStyle(
        color: COLOR_CONST.light_accent,
        fontSize: 28,
        fontWeight: FontWeight.w600,
      ),
      contentTextStyle: TextStyle(
        fontSize: 22,
        color: COLOR_CONST.light_headline6,
      ),
    ),
  );

  static ThemeData dark = ThemeData(
    fontFamily: "Baomoi", //GoogleFonts.montserrat().fontFamily,
    primaryColor: COLOR_CONST.dark_primary,
    accentColor: COLOR_CONST.dark_accent,
    backgroundColor: COLOR_CONST.dark_background,
    scaffoldBackgroundColor: COLOR_CONST.dark_background,
    canvasColor: COLOR_CONST.dark_background,
    navigationRailTheme: NavigationRailThemeData(
      elevation: 16.0,
      backgroundColor: COLOR_CONST.dark_background,
      unselectedIconTheme: IconThemeData(
        color: COLOR_CONST.dark_accent,
        size: 40,
      ),
      selectedIconTheme: IconThemeData(
        color: COLOR_CONST.dark_primary,
        size: 40,
      ),
      unselectedLabelTextStyle: TextStyle(
        color: COLOR_CONST.dark_accent,
        fontSize: 18,
      ),
      selectedLabelTextStyle: TextStyle(
        color: COLOR_CONST.dark_primary,
        fontSize: 18,
      ),
    ),
    colorScheme: ColorScheme.dark(
      primary: COLOR_CONST.dark_primary,
      secondary: COLOR_CONST.dark_accent,
      background: COLOR_CONST.dark_background,
      onPrimary: COLOR_CONST.dark_background,
      onSecondary: COLOR_CONST.dark_primary,
      onBackground: Colors.white,
      onSurface: Colors.white,
    ),
  );
}
