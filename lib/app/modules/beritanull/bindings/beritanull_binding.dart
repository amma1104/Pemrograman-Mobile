import 'package:get/get.dart';
import 'package:tugasteori1/app/modules/beritanull/controllers/beritanull_controller.dart';

class BeritanullBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BeritanullController>(() => BeritanullController());
  }
}
