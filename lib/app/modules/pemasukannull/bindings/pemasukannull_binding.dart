import 'package:get/get.dart';
import 'package:tugasteori1/app/modules/pemasukannull/controllers/pemasukannull_controller.dart';


class PemasukannullBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PemasukannullController>(() => PemasukannullController());
  }
}
