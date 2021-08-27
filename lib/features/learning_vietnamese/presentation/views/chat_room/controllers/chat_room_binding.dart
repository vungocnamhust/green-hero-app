import 'package:get/get.dart';
import 'chat_room_controller.dart';

class ChatRoomBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ChatRoomController());
  }
}