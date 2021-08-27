import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_vietnamese/core/util/screen_util.dart';

Card buildCardLV(BuildContext context, Widget content, String subcontent) {
  return Card(
    elevation: 5,
    color: Color(0xff304775),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8,
              right: 8,
            ),
          ),
        ),
        Spacer(
          flex: 1,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: content,
        ),
        Spacer(
          flex: 8,
        ),
        Container(
          width: double.infinity,
          height: ScreenUtil.height * 0.07,
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Text(
            subcontent,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          color: Theme.of(context).indicatorColor,
        )
      ],
    ),
  );
}
