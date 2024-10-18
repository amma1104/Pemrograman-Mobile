import 'package:get/get.dart';
import 'package:tugasteori1/app/modules/profilenull/controllers/profilenull_controller.dart';

class ProfilenullBinding extends Bindings {
  @override
  void dependencies() {
    // Memasukkan controller ke dalam memori saat binding dilakukan
    Get.lazyPut<ProfilenullController>(() => ProfilenullController());
  }
}
