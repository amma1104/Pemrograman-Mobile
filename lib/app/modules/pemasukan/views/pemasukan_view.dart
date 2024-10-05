import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugasteori1/app/modules/pemasukan/controllers/pemasukan_controller.dart';
import 'package:tugasteori1/app/modules/pengeluaran/views/pengeluaran_view.dart';
import 'package:tugasteori1/app/routes/app_routes.dart';

// Halaman utama dengan BottomNavigationBar
class PemasukanView extends StatefulWidget {
  @override
  _PemasukanViewState createState() => _PemasukanViewState();
}

class _PemasukanViewState extends State<PemasukanView> {
  int _selectedIndex = 0; // To track the selected tab

  // List of views to navigate between
  final List<Widget> _pages = [
    PemasukanMainView(),  // Halaman Pemasukan
    StatistikView(),      // Halaman Statistik
    BeritaView(),         // Halaman Berita
    ProfilView(),         // Halaman Profil
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
      // If the "Profil" tab is selected, navigate to ProfilView
      if (index == 3) {
        Get.toNamed(AppRoutes.profile);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: IndexedStack(
        index: _selectedIndex, // Kontrol halaman yang ditampilkan
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Tab yang aktif
        onTap: _onItemTapped,         // Mengubah tab
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stacked_bar_chart_rounded),
            label: 'Statistik',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_rounded),
            label: 'Berita',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_rounded),
            label: 'Profil',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }
}

// Halaman utama untuk Pemasukan
class PemasukanMainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<PemasukanController>(() => PemasukanController());
    final PemasukanController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.toNamed(AppRoutes.home);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Aksi notifikasi
            },
          ),
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          // Background dan isi halaman
          SingleChildScrollView(
            child: Column(
              children: [
                // Informasi pengguna dan saldo
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  padding: EdgeInsets.only(
                    top: 20,
                    left: 20,
                    right: 20,
                    bottom: 80,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'Hi, Mas Fuad Mandalika!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 50),
                      Center(
                        child: Text(
                          'Rp. 10.000.000,00',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Center(
                        child: Text(
                          'Total saldo Anda',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // Pendapatan Bulan Ini
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    padding: EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pendapatan Bulan ini',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(height: 1),
                        Text(
                          'Rp. 5.000.000,00',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Image.asset(
                          'lib/Screenshot 2024-10-04 141929.png',
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),

                // Pendapatan terakhir
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Pendapatan terakhir lu',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                // Daftar transaksi
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TransactionItem(
                          icon: Icons.coffee_maker_rounded,
                          name: 'Maju Jaya Coffee',
                          date: 'October 4, 2024',
                          amount: 'Rp.1.600.000',
                        ),
                        TransactionItem(
                          icon: Icons.build_rounded,
                          name: 'Zeus Motorworks',
                          date: 'October 4, 2024',
                          amount: 'Rp.2.000.000',
                        ),
                        TransactionItem(
                          icon: Icons.design_services_rounded,
                          name: 'Freelance Design',
                          date: 'October 4, 2024',
                          amount: 'Rp.800.000',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Tab Pemasukan dan Pengeluaran
          Positioned(
            top: 240,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Obx(() => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () => controller.switchTab('Pemasukan'),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                        decoration: BoxDecoration(
                          color: controller.selectedTab.value == 'Pemasukan'
                              ? Colors.greenAccent
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: controller.selectedTab.value == 'Pemasukan'
                                ? Colors.greenAccent
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          'Pemasukan',
                          style: TextStyle(
                            color: controller.selectedTab.value == 'Pemasukan'
                                ? Colors.white
                                : Colors.grey[600],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.switchTab('Pengeluaran');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PengeluaranView()),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                        decoration: BoxDecoration(
                          color: controller.selectedTab.value == 'Pengeluaran'
                              ? Colors.redAccent
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: controller.selectedTab.value == 'Pengeluaran'
                                ? Colors.redAccent
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          'Pengeluaran',
                          style: TextStyle(
                            color: controller.selectedTab.value == 'Pengeluaran'
                                ? Colors.white
                                : Colors.grey[600],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

// Widget untuk item transaksi
class TransactionItem extends StatelessWidget {
  final IconData icon;
  final String name;
  final String date;
  final String amount;

  TransactionItem({
    required this.icon,
    required this.name,
    required this.date,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(icon),
      ),
      title: Text(name),
      subtitle: Text(date),
      trailing: Text(
        amount,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// Simulasi halaman lainnya
class StatistikView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Statistik'));
  }
}

class BeritaView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Berita'));
  }
}

class ProfilView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Profil'));
  }
}
