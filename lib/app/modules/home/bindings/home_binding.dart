import 'package:get/get.dart';
import 'package:tugasteori1/app/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Bind HomeController to the HomeView
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
