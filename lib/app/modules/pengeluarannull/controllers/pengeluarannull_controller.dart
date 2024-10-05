import 'package:get/get.dart';

class PengeluarannullController extends GetxController {
  var isPemasukanSelected = false.obs; // Observable variable

  void togglePemasukan() {
    isPemasukanSelected.value = true;// Select Pemasukan
    Get.toNamed('/pemasukannull');
  }

  void togglePengeluaran() {
    isPemasukanSelected.value = false; // Select Pengeluaran
  }
}