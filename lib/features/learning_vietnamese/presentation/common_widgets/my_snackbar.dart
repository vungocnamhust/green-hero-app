import 'package:flutter/material.dart';
import 'package:learning_vietnamese/core/Constant/COLOR_CONST.dart';

class MySnackBar {
  static void showLoading(BuildContext context) {
    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Processing ...'),
              CircularProgressIndicator()
            ],
          ),
        ),
      );
  }

  static void hideLoading(BuildContext context) {
    Scaffold.of(context)..hideCurrentSnackBar();
  }

  static void failure(BuildContext context, {String msg = "Failure"}) {
    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(msg),
              Icon(Icons.error),
            ],
          ),
          backgroundColor: Colors.red,
        ),
      );
  }

  static void success(BuildContext context, String msg) {
    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            children: <Widget>[
              Text(msg),
            ],
          ),
          backgroundColor: COLOR_CONST.DEFAULT,
        ),
      );
  }
}
