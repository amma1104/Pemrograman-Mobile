import 'package:get/get.dart';
import 'package:tugasteori1/app/modules/profile/controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    // Memasukkan controller ke dalam memori saat binding dilakukan
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
