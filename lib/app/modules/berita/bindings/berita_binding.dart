import 'package:get/get.dart';
import 'package:tugasteori1/app/modules/berita/controllers/berita_controller.dart';

class BeritaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BeritaController>(() => BeritaController());
  }
}
