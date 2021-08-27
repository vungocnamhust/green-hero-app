
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class MainTabController extends GetxController {
  PageController pageController;
  final tab = 0.obs;
  void changeTab(int value) {
    tab.value = value;
    pageController.jumpToPage(value);
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: tab.value);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

}

class MainTabIndex {
  static const int LEARN = 0;
  static const int PROFILE = 1;
  static const int LEADERBOARD = 2;
  static const int STORE = 3;
}