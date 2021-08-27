import 'package:get/get.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/presentation/global_controllers/main_tab_controller.dart';

class MainTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainTabController());
  }
}
