import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BorderedButton extends StatelessWidget {
  final Widget child;
  final Function() onTap;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final double borderWidth;

  BorderedButton({
    @required this.child,
    @required this.onTap,
    Color backgroundColor,
    Color borderColor,
    Color textColor,
    double borderWidth,
  })  : this.backgroundColor = backgroundColor ?? Colors.white,
        this.borderColor = borderColor ?? Get.theme.accentColor,
        this.textColor = textColor ?? Get.theme.accentColor,
        this.borderWidth = borderWidth ?? 2.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: this.backgroundColor,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: this.borderColor,
          width: this.borderWidth,
        ),
        boxShadow: [
          BoxShadow(
            color: this.borderColor,
            offset: Offset(0, this.borderWidth * 1.5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          color: Colors.white,
          child: FlatButton(
            onPressed: () => this.onTap(),
            color: this.backgroundColor,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: Theme(
              data: Get.theme.copyWith(
                iconTheme: IconThemeData(color: this.textColor),
              ),
              child: DefaultTextStyle(
                style: Get.textTheme.headline5.copyWith(
                  color: this.textColor,
                  height: 1.2,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                child: this.child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
