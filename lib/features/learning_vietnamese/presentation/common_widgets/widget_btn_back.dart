import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_vietnamese/core/util/color_lv.dart';

class WidgetButtonBack extends StatelessWidget {
  final Function() onBack;

  WidgetButtonBack({this.onBack});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: this.onBack ?? () => Get.back(),
      icon: Icon(
        Icons.arrow_back_rounded,
        size: 30,
        color: ColorLV.accent,
      ),
    );
  }
}
