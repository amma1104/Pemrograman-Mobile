import 'package:get/get.dart';

class PengeluaranController extends GetxController {
  var isPemasukanSelected = false.obs; // Observable variable

  void togglePemasukan() {
    isPemasukanSelected.value = true;// Select Pemasukan
    Get.toNamed('/pemasukan');
  }

  void togglePengeluaran() {
    isPemasukanSelected.value = false; // Select Pengeluaran
  }
}
