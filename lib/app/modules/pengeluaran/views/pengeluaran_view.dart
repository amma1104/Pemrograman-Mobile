import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugasteori1/app/routes/app_routes.dart';
import '../controllers/pengeluaran_controller.dart';

// Halaman PengeluaranView dengan BottomNavigationBar
class PengeluaranView extends StatefulWidget {
  @override
  _PengeluaranViewState createState() => _PengeluaranViewState();
}

class _PengeluaranViewState extends State<PengeluaranView> {
  int _selectedIndex = 0;

  // Daftar halaman yang dapat dinavigasi
  final List<Widget> _pages = [
    PengeluaranMainView(),  // Halaman Pengeluaran
    StatistikView(),        // Halaman Statistik
    NewsView(),           // Halaman Berita
    ProfilView(),           // Halaman Profil
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index

      // Navigate to Pemasukan when Home (index 0) is pressed
      if (index == 0) {
        Get.toNamed(AppRoutes.pengeluaran); // Change this route to your PemasukanView route
      }
      if (index == 2) {
        Get.toNamed(AppRoutes.berita);
      }
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
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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

// Halaman utama untuk Pengeluaran
class PengeluaranMainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<PengeluaranController>(() => PengeluaranController());
    final PengeluaranController controller = Get.find();

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
          SingleChildScrollView(
            child: Column(
              children: [
                // Informasi Pengguna dan Saldo
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

                // Pengeluaran Bulan Ini
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
                          'Pengeluaran Bulan ini',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(height: 1),
                        Text(
                          'Rp. 3.000.000,00',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Image.asset('lib/Screenshot 2024-10-04 141744.png', height: 100, fit: BoxFit.cover),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),

                // Pengeluaran Terakhir
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Pengeluaran terakhir lu',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                // Daftar Transaksi Pengeluaran
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
                          icon: Icons.home_rounded,
                          name: 'Boarding house',
                          date: 'October 4, 2024',
                          amount: 'Rp.1.500.000',
                        ),
                        TransactionItem(
                          icon: Icons.video_collection_rounded,
                          name: 'Netflix',
                          date: 'October 4, 2024',
                          amount: 'Rp.99.000',
                        ),
                        TransactionItem(
                          icon: Icons.fastfood_rounded,
                          name: 'Konsumsi',
                          date: 'October 4, 2024',
                          amount: 'Rp.100.000',
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
                      onTap: () => controller.togglePemasukan(),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                        decoration: BoxDecoration(
                          color: controller.isPemasukanSelected.value
                              ? Colors.greenAccent
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: controller.isPemasukanSelected.value
                                ? Colors.greenAccent
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          'Pemasukan',
                          style: TextStyle(
                            color: controller.isPemasukanSelected.value
                                ? Colors.white
                                : Colors.grey[600],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => controller.togglePengeluaran(),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                        decoration: BoxDecoration(
                          color: !controller.isPemasukanSelected.value
                              ? Colors.redAccent
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: !controller.isPemasukanSelected.value
                                ? Colors.redAccent
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          'Pengeluaran',
                          style: TextStyle(
                            color: !controller.isPemasukanSelected.value
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

// Halaman lain yang dapat diakses melalui BottomNavigationBar
class StatistikView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Statistik'));
  }
}

class NewsView extends StatelessWidget {
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
