import 'package:flutter/material.dart';
import 'package:learning_vietnamese/core/util/color_lv.dart';

class WidgetReload extends StatelessWidget {
  final Function() reload;
  WidgetReload(this.reload);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: IconButton(
          icon: Icon(Icons.refresh_rounded),
          color: ColorLV.accent,
          iconSize: 56,
          onPressed: reload,
        ),
      ),
    );
  }
}
