import 'package:flutter/material.dart';
import 'package:learning_vietnamese/core/util/color_lv.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/presentation/common_widgets/appbar_lv.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/presentation/common_widgets/icon_star.dart';

class StoreScreen extends StatefulWidget {
  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> with AutomaticKeepAliveClientMixin<StoreScreen> {
  @override
  bool get wantKeepAlive => true;

  // Widget appbar() {
  //   return AppBarLV(
  //     title: Text(
  //       'CỬA HÀNG',
  //     ),
  //     subTitle: Row(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         IconStar(),
  //         SizedBox(width: 8.0),
  //         Text('2051'),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Cửa hàng",
            style: TextStyle(
              color: ColorLV.accent,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Coming soon...',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
