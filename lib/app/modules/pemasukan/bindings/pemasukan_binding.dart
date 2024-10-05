import 'package:get/get.dart';
import 'package:tugasteori1/app/modules/pemasukan/controllers/pemasukan_controller.dart';


class PemasukanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PemasukanController>(() => PemasukanController());
  }
}
