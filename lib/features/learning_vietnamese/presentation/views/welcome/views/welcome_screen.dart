import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:learning_vietnamese/core/util/color_lv.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/presentation/common_widgets/border_lv.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/presentation/common_widgets/btn.dart';
import 'package:learning_vietnamese/router.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: BorderLV(
                child: Center(
                  child: Text(
                    'Logo app hoặc là icon gì đó',
                    style: TextStyle(
                      fontSize: 30,
                      color: ColorLV.primary,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 30.0),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        'HỌC TIẾNG VIỆT',
                        style: TextStyle(
                          color: ColorLV.primary,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  ButtonLV(
                    onTap: () => Get.toNamed(RouterLV.INTRO),
                    title: Text(
                      'BẮT ĐẦU',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  ButtonLV(
                    onTap: () => Get.toNamed(RouterLV.LOGIN),
                    backgroundColor: ColorLV.accent,
                    textColor: ColorLV.primary,
                    title: Text(
                      'TÔI ĐÃ CÓ TÀI KHOẢN',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
