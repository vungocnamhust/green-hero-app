import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/presentation/common_widgets/app_logo/app_logo.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/presentation/global_controllers/main_tab_controller.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/presentation/views/store/views/store_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  @override
  _MainNavigationScreenState createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final controller = Get.find<MainTabController>();

  List<NavigationRailDestination> tabIcons = const [
    const NavigationRailDestination(
      icon: Icon(Icons.school),
      label: Text('Học'),
    ),
    const NavigationRailDestination(
      icon: Icon(Icons.account_circle),
      label: Text('Cá nhân'),
    ),
    const NavigationRailDestination(
      icon: Icon(Icons.article_sharp),
      label: Text('Xếp hạng'),
    ),
    const NavigationRailDestination(
      icon: Icon(Icons.shopping_cart),
      label: Text('Cửa hàng'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        resizeToAvoidBottomPadding: true,
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   centerTitle: true,
        //   title: Obx(
        //     () {
        //       switch (controller.tab.value) {
        //         case MainTabIndex.PROFILE:
        //           return Text(
        //             'Thông tin cá nhân',
        //             style: TextStyle(fontSize: 30),
        //           );
        //         case MainTabIndex.LEARN:
        //         default:
        //           return Center(
        //             child: Image.asset(
        //               'lib/assets/app_logo/logo_full_horizontal.png',
        //               fit: BoxFit.contain,
        //               height: 40,
        //             ),
        //           );
        //           break;
        //       }
        //     },
        //   ),
        // ),
        body: Row(
          children: [
            Expanded(
              child: PageView(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                controller: controller.pageController,
                children: [
                  // CategoryOverview(),
                  // ProfileScreen(),
                  // UserProgressScreen(),
                  StoreScreen(),
                  // WritingPage(),
                ],
              ),
              // Obx(() {
              //   return IndexedStack(
              //     index: controller.tab.value,
              //     children: [
              //       GetBuilder<LearnScreenController>(
              //         init: LearnScreenController(),
              //         builder: (_) => CategoryOverview(),
              //       ),
              //       ProfileScreen(),
              //       UserProgressScreen(),
              //       StoreScreen(),
              //     ],
              //   );
              // }),
            ),
            SingleChildScrollView(
              child: SizedBox(
                width: 64,
                height: Get.height,
                child: Obx(() {
                  return NavigationRail(
                    leading: Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                        // bottom: 30,
                        left: 4,
                        right: 4,
                      ),
                      child: AppLogo.small(height: 40),
                    ),
                    trailing: SizedBox(height: 74),
                    selectedIndex: controller.tab.value,
                    onDestinationSelected: (value) =>
                        controller.changeTab(value),
                    groupAlignment: 0.0,
                    labelType: NavigationRailLabelType.none,
                    destinations: tabIcons,
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
