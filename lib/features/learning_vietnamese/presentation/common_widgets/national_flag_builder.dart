import 'package:flutter/material.dart';

class NationalFlagBuilder extends StatelessWidget {
  final String nationCode;
  final double borderRadius;
  final double width;
  final double height;
  NationalFlagBuilder(
    this.nationCode, {
    this.borderRadius,
    this.width,
    this.height,
  }) : assert(nationCode != null && nationCode.isNotEmpty);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 4),
      child: Image.asset(
        'lib/assets/flags/$nationCode.png',
        fit: BoxFit.contain,
        width: width,
        height: height ?? 30,
      ),
    );
  }
}
