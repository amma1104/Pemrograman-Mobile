import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugasteori1/app/modules/pemasukannull/controllers/pemasukannull_controller.dart';
import 'package:tugasteori1/app/modules/pengeluarannull/views/pengeluarannull_view.dart';
import 'package:tugasteori1/app/routes/app_routes.dart';

class PemasukannullView extends StatefulWidget {
  @override
  _PemasukannullViewState createState() => _PemasukannullViewState();
}

class _PemasukannullViewState extends State<PemasukannullView> {
  int _selectedIndex = 0;

  // Daftar halaman yang dapat dinavigasi di BottomNavigationBar
  final List<Widget> _pages = [
    PemasukannullMainView(),
    StatistikView(),
    NewsView(),
    ProfilnullView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index

      // Navigate to Pemasukan when Home (index 0) is pressed
      if (index == 0) {
        Get.toNamed(AppRoutes.pemasukannull); // Change this route to your PemasukanView route
      }
      if (index == 2) {
        Get.toNamed(AppRoutes.beritanull);
      }
      // If the "Profil" tab is selected, navigate to ProfilView
      if (index == 3) {
        Get.toNamed(AppRoutes.profilenull);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<PemasukannullController>(() => PemasukannullController());
    final PemasukannullController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.toNamed(AppRoutes.home);
            // Aksi kembali
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

// Halaman utama untuk pemasukan
class PemasukannullMainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<PemasukannullController>(() => PemasukannullController());
    final PemasukannullController controller = Get.find();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // Bagian atas dengan info pengguna dan saldo
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
                        'Hi, User!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 50),
                      Center(
                        child: Text(
                          'Rp. 0',
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
                  child: SizedBox(
                  width: 500,
                  height: 200,
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
                          'Rp. 0',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ),
                SizedBox(height: 10),

                // Pendapatan Terakhir
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

                // Daftar Transaksi Pendapatan Terakhir
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                  width: 500,
                  height: 200,
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
                      onTap: () => controller.switchTab('Pemasukannull'),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                        decoration: BoxDecoration(
                          color: controller.selectedTab.value == 'Pemasukannull'
                              ? Colors.greenAccent
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: controller.selectedTab.value == 'Pemasukannull'
                                ? Colors.greenAccent
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          'Pemasukan',
                          style: TextStyle(
                            color: controller.selectedTab.value == 'Pemasukannull'
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
                          MaterialPageRoute(builder: (context) => PengeluarannullView()),
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

class ProfilnullView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Profil'));
  }
}
