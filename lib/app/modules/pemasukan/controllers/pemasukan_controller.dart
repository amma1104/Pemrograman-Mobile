import 'package:get/get.dart';

class PemasukanController extends GetxController {
  // Saldo total
  var totalSaldo = 10000000.0.obs;

  // Pendapatan bulan ini
  var pendapatanBulanIni = 5000000.0.obs;

  // Tipe pilihan (Pemasukan atau Pengeluaran)
  var selectedTab = 'Pemasukan'.obs;

  // Data transaksi pendapatan terbaru
  var recentTransactions = <Map<String, dynamic>>[
    {
      'name': 'Maju Jaya Coffee',
      'date': 'October 4, 2024',
      'amount': 1600000,
    },
    {
      'name': 'Zeus Motorworks',
      'date': 'October 4, 2024',
      'amount': 2000000,
    },
    {
      'name': 'Freelance Design',
      'date': 'October 4, 2024',
      'amount': 800000,
    },
  ].obs;

  // Ganti tab antara "Pemasukan" dan "Pengeluaran"
  void switchTab(String tab) {
    selectedTab.value = tab;
  }
}
