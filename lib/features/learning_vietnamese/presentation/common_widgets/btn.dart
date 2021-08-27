import 'package:flutter/material.dart';
import 'package:learning_vietnamese/core/util/color_lv.dart';

class ButtonLV extends StatelessWidget {
  ButtonLV({
    @required this.title,
    this.onTap,
    Color backgroundColor,
    Color textColor,
    Color borderColor,
    this.borderRadius = 30.0,
    this.padding = const EdgeInsets.symmetric(
      vertical: 12,
      horizontal: 16,
    ),
  })  : this.backgroundColor = backgroundColor, // ?? ColorLV.primary,
        // this.borderColor = borderColor ?? (backgroundColor ?? ColorLV.primary),
        this.textColor = textColor ?? ColorLV.background;

  final Widget title;
  final Color backgroundColor;
  final Color textColor;
  // final Color borderColor;
  final EdgeInsets padding;
  final double borderRadius;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: backgroundColor,
        gradient: backgroundColor == null
            ? LinearGradient(
                colors: [Colors.white, Color(0xFFFEE761)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.8],
              )
            : null,
        boxShadow: [
          BoxShadow(
            color: Color(0xFFE3E0C8),
            blurRadius: 3,
            spreadRadius: 1,
            offset: Offset.zero,
          ),
        ],
      ),
      child: FlatButton(
        color: Colors.transparent,
        textColor: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: padding,
        onPressed: onTap,
        child: title,
      ),
    );
  }
}