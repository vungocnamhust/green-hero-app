import 'package:get/state_manager.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/domain/entities/Account/account.dart';

class MainController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    initAccounts();
    print("Init MainController");
  }

  List<Account> accounts = <Account>[].obs;

  void initAccounts() {
    List<Account> accountsData = [
      Account(
          name: "Sở Tài nguyên & Môi trường Hà Nội",
          lastMsg: "[Hình ảnh] Phản ánh tình trạng...",
          updatedAt: "7 giờ",
          thumbnail: "lib/assets/accounts/tai_nguyen_moi_truong.png"),
      Account(
          name: "Sở Tài nguyên & Môi trường Hà Nội",
          lastMsg: "[Hình ảnh] Phản ánh tình trạng...",
          updatedAt: "7 giờ",
          thumbnail: "lib/assets/accounts/tai_nguyen_moi_truong.png"),
      Account(
          name: "Sở Tài nguyên & Môi trường Hà Nội",
          lastMsg: "[Hình ảnh] Phản ánh tình trạng...",
          updatedAt: "7 giờ",
          thumbnail: "lib/assets/accounts/tai_nguyen_moi_truong.png"),
      Account(
          name: "Sở Tài nguyên & Môi trường Hà Nội",
          lastMsg: "[Hình ảnh] Phản ánh tình trạng...",
          updatedAt: "7 giờ",
          thumbnail: "lib/assets/accounts/tai_nguyen_moi_truong.png"),
                Account(
          name: "Sở Tài nguyên & Môi trường Hà Nội",
          lastMsg: "[Hình ảnh] Phản ánh tình trạng...",
          updatedAt: "7 giờ",
          thumbnail: "lib/assets/accounts/tai_nguyen_moi_truong.png"),
      Account(
          name: "Sở Tài nguyên & Môi trường Hà Nội",
          lastMsg: "[Hình ảnh] Phản ánh tình trạng...",
          updatedAt: "7 giờ",
          thumbnail: "lib/assets/accounts/tai_nguyen_moi_truong.png"),
      Account(
          name: "Sở Tài nguyên & Môi trường Hà Nội",
          lastMsg: "[Hình ảnh] Phản ánh tình trạng...",
          updatedAt: "7 giờ",
          thumbnail: "lib/assets/accounts/tai_nguyen_moi_truong.png"),
      Account(
          name: "Sở Tài nguyên & Môi trường Hà Nội",
          lastMsg: "[Hình ảnh] Phản ánh tình trạng...",
          updatedAt: "7 giờ",
          thumbnail: "lib/assets/accounts/tai_nguyen_moi_truong.png"),
      Account(
          name: "Sở Tài nguyên & Môi trường Hà Nội",
          lastMsg: "[Hình ảnh] Phản ánh tình trạng...",
          updatedAt: "7 giờ",
          thumbnail: "lib/assets/accounts/tai_nguyen_moi_truong.png"),
      Account(
          name: "Sở Tài nguyên & Môi trường Hà Nội",
          lastMsg: "[Hình ảnh] Phản ánh tình trạng...",
          updatedAt: "7 giờ",
          thumbnail: "lib/assets/accounts/tai_nguyen_moi_truong.png"),
    ];
    for (int i = 0; i < accountsData.length - 1; i++) {
      accounts.add(accountsData.elementAt(i));
    }
  }

  void addAccount(Account account) {
    accounts.add(account);
  }
}
