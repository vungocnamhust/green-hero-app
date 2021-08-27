import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  static String _imagePath = 'lib/assets/app_logo/logo_splash.png';

  final double height;
  final double width;

  AppLogo({this.height, this.width});

  factory AppLogo.small({double height, double width}) {
    _imagePath = 'lib/assets/app_logo/logo_small.png';
    return AppLogo(height: height, width: width);
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _imagePath,
      fit: BoxFit.contain,
      height: this.height,
      width: this.width,
    );
  }
}
