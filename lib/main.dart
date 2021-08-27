import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:learning_vietnamese/core/util/color_lv.dart';
import 'package:learning_vietnamese/core/util/screen_util.dart';
import 'package:learning_vietnamese/core/util/storage_util.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/presentation/views/welcome/views/splash.dart';
import 'package:learning_vietnamese/router.dart';
import 'package:learning_vietnamese/theme.dart';

void mainGreenHero() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageUtil.init();
  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  await SystemChrome.setPreferredOrientations([
    // DeviceOrientation.landscapeRight,
    // DeviceOrientation.landscapeLeft,
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  if (!kReleaseMode) AudioPlayer.logEnabled = true;
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: RouterLV.pages,
      defaultTransition: Transition.cupertino,
      debugShowCheckedModeBanner: false,
      title: 'Zalo',
      theme: ThemeLV.light,
      darkTheme: ThemeLV.dark,
      themeMode: ThemeMode.light,
      // initialBinding: AuthBinding(),
      builder: (context, child) {
        return MediaQuery(
          child: child,
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: 1.0,
          ),
        );
      },
      home: Builder(
        builder: (context) {
          ColorLV.init(context);
          ScreenUtil.init(context);
          // return LearningResultScreen();
          return SplashScreen();
        },
      ),
    );
  }
}
