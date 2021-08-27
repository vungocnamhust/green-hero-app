import 'package:flutter/material.dart';

class ScreenUtil {

  static double _width;
  static double get width => _width;

  static double _height;
  static double get height => _height;

  static void init(BuildContext context) {
    MediaQueryData data = MediaQuery.of(context);
    _width = data.size.width;
    _height = data.size.height;
  }
}