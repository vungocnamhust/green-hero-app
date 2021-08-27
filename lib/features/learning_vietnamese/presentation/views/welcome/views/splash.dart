import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_vietnamese/router.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1000), () => {
      Get.offAllNamed(
        RouterLV.MAIN,
        predicate: (route) => false,
      )
    });
    // Get.find<AuthController>().authState.listen((state) {
    //   switch (state) {
    //     case AuthState.Unauthenticated:
    //       Get.offAllNamed(
    //         RouterLV.LOGIN,
    //         predicate: (route) => false,
    //       );
    //       break;
    //     case AuthState.Authenticated:
    //       Get.offAllNamed(
    //         RouterLV.MAIN_NAVIGATION,
    //         predicate: (route) => false,
    //       );
    //       break;
    //     default:
    //       break;
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/assets/app_logo/logo_splash.png'),
              fit: BoxFit.fill),
        ),
      ),
    );
  }
}
