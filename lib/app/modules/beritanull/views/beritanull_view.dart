import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugasteori1/app/modules/berita/views/webview_container.dart';
import 'package:tugasteori1/app/modules/beritanull/controllers/beritanull_controller.dart';
import 'package:tugasteori1/app/modules/home/views/home_view.dart';
import 'package:tugasteori1/app/routes/app_routes.dart';

class BeritanullView extends StatefulWidget {
  @override
  _BeritanullViewState createState() => _BeritanullViewState();
}

class _BeritanullViewState extends State<BeritanullView> {
  final BeritanullController controller = Get.find();

  // Index untuk navigasi antar tab
  int _selectedIndex = 2; // Default adalah tab "Berita"

  // Daftar halaman yang sesuai dengan navigasi bar
  final List<Widget> _pages = [
    HomeView(),       // Tab Home
    StatistikView(),  // Tab Statistik
    NewsView(),       // Tab Berita
    ProfilView(),     // Tab Profil
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index

      // Navigate to Pemasukan when Home (index 0) is pressed
      if (index == 0) {
        Get.toNamed(AppRoutes.pemasukannull); // Change this route to your PemasukanView route
      }
      if (index == 2) {
        Get.toNamed(AppRoutes.berita);
      }
      // If the "Profil" tab is selected, navigate to ProfilView
      if (index == 3) {
        Get.toNamed(AppRoutes.profilenull);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<BeritanullController>(() => BeritanullController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Berita',
          style: TextStyle(color: Colors.white), // Set warna teks menjadi putih
        ),
        backgroundColor: Colors.blue, // Set warna app bar menjadi biru
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: controller.beritaList.length,
            itemBuilder: (context, index) {
              var berita = controller.beritaList[index];
              return GestureDetector(
                onTap: () {
                  Get.to(() => WebViewContainer(berita.url));
                },
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0), // Jarak vertikal antar berita
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25), // Rounded corners
                  ),
                  child: Stack(
                    children: [
                      // Thumbnail with a dark overlay
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Stack(
                          children: [
                            Image.network(
                              berita.imageUrl,
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                            Container(
                              width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.black.withOpacity(0.4), Colors.transparent],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Centered title
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center, // Center the title
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              berita.title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center, // Ensure text is centered
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2, // Ensure title wraps to two lines at most
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      }),
      // Bottom Navigation Bar
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

// Simulasi halaman lainnya
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
