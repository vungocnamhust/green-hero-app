import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/bindings/main_tab_binding.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/presentation/views/chat_room/controllers/chat_room_binding.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/presentation/views/chat_room/views/chat_room_screen.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/presentation/views/home/views/main_navigation_screen.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/presentation/views/main/views/main_screen.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/presentation/views/welcome/views/splash.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/presentation/views/welcome/views/welcome_screen.dart';
import 'package:learning_vietnamese/main.dart';

import 'features/learning_vietnamese/presentation/views/main/controllers/main_binding.dart';


class RouterLV {
  static const String SPLASH = '/';
  static const String HOME = '/home';
  static const String LOGIN = '/login';
  static const String REGISTER = '/register';
  static const String LIST_TOPICS = '/list_topics';
  static const String MAIN_NAVIGATION = '/main_navigation';
  static const String WELCOME = '/welcome';
  static const String INTRO = '/intro';
  static const String SUBTOPIC_OVERVIEW = '/subtopic/overview';
  static const String SUBTOPIC_PAGE_VIEW = '/subtopic/page_view';
  static const String LEARNING_RESULT = '/learning_result';
  static const String SUBTOPIC_TEXT_TRANSLATE = '/subtopic/text_translate';
  static const String IMAGE_PREVIEW = '/image_preview';
  static const String VIDEO_PREVIEW = '/video_preview';

  static const String AVATAR_PREVIEW = '/avatar_preview';
  static const String UPDATE_USER_PROFILE = '/update_user_profile';

  static const String TEST_RESULT_SUMMARY_SCREEN =
      '/test_result_summary_screen';

  // unimplemented screen
  static const String MYACHIVEMENTS = '/my_achivements';
  static const String STICKERSTORE = '/sticker_store';
  static const String SHAREWITHFRIENDS = '/share_with_freinds';
  static const String RATEUS = '/rate_us';
  static const String FEEDBACK = '/feedback';
  static const String SETTINGS = '/settings';
  static const String MAIN = '/main';
  static const String CHATROOM = '/chat_room';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME:
        return CupertinoPageRoute(builder: (_) => MyApp());
      case WELCOME:
        return CupertinoPageRoute(builder: (_) => WelcomeScreen());
      case MAIN_NAVIGATION:
        return CupertinoPageRoute(builder: (_) => MainNavigationScreen());
      case MAIN:
        return CupertinoPageRoute(builder: (_) => MainScreen());
      case CHATROOM:
        return CupertinoPageRoute(builder: (_) => ChatRoomScreen());

      default:
        return CupertinoPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  static final pages = [
    GetPage(
      name: SPLASH,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: MAIN,
      page: () => MainScreen(),
      bindings: [
        MainBinding(),
        ChatRoomBinding(),
      ]
    ),
    GetPage(
      name: CHATROOM,
      page: () => ChatRoomScreen(),
      binding: ChatRoomBinding(),
    ),
  ];
}
