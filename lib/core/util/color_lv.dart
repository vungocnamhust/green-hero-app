import 'package:flutter/material.dart';

class ColorLV {

  static Color _primary;
  static Color get primary => _primary;

  static Color _accent;
  static Color get accent => _accent;

  static Color _background;
  static Color get background => _background;

  static void init(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    _primary = themeData.primaryColor;
    _accent = themeData.accentColor;
    _background = themeData.backgroundColor;
  }
}