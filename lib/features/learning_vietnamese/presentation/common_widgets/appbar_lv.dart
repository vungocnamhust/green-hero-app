import 'package:flutter/material.dart';
import 'package:learning_vietnamese/core/util/color_lv.dart';
import 'package:learning_vietnamese/core/util/screen_util.dart';

class AppBarLV extends StatelessWidget {
  final Widget title;
  final Widget subTitle;
  final EdgeInsets padding;

  const AppBarLV({
    this.title,
    this.subTitle,
    this.padding = const EdgeInsets.symmetric(
      vertical: 12.0,
      horizontal: 24.0,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      shadowColor: ColorLV.accent,
      color: ColorLV.background,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(8.0),
        bottomRight: Radius.circular(8.0),
      ),
      textStyle: TextStyle(
        color: ColorLV.primary,
        fontWeight: FontWeight.bold,
        fontSize: 26,
      ),
      child: Container(
        height: 70,
        width: ScreenUtil.width * 3 / 5,
        alignment: Alignment.center,
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            title ?? SizedBox.shrink(),
            subTitle ?? SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
