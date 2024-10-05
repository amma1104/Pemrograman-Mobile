import 'package:get/get.dart';
import '../controllers/pengeluarannull_controller.dart';

class PengeluarannullBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengeluarannullController>(() => PengeluarannullController());
  }
}
