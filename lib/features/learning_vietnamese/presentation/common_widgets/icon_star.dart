import 'package:flutter/material.dart';

class IconStar extends StatelessWidget {
  final double size;

  const IconStar({this.size = 30});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star,
      color: Color(0xFFFAFF00),
      size: size,
    );
  }
}
