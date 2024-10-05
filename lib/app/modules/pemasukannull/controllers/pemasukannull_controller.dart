import 'package:get/get.dart';

class PemasukannullController extends GetxController {
  // Saldo total
  var totalSaldo = 0.obs;

  // Pendapatan bulan ini
  var pendapatanBulanIni = 0.obs;

  // Tipe pilihan (Pemasukan atau Pengeluaran)
  var selectedTab = 'Pemasukannull'.obs;

  // Ganti tab antara "Pemasukan" dan "Pengeluaran"
  void switchTab(String tab) {
    selectedTab.value = tab;
  }
}