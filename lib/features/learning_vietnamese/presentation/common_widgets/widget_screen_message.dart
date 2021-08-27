import 'package:flutter/material.dart';
import 'package:learning_vietnamese/core/Constant/FONT_CONST.dart';

class WidgetScreenMessage extends StatelessWidget {
  String msg;

  WidgetScreenMessage({@required this.msg});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(msg, style: FONT_CONST.REGULAR_GRAY4_14),
        ),
      ),
    );
  }
}
