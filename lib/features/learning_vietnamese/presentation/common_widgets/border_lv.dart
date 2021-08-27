import 'package:flutter/material.dart';
import 'package:learning_vietnamese/core/util/color_lv.dart';

class BorderLV extends StatelessWidget {
  final Widget child;
  const BorderLV({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: ColorLV.primary,
          width: 3.0,
        ),
      ),
      child: child,
    );
  }
}