import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugasteori1/app/modules/profile/controllers/profile_controller.dart';
import 'package:tugasteori1/app/routes/app_routes.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  int _selectedIndex = 3;


  final List<Widget> _pages = [
    PemasukanMainView(), // Halaman Home
    StatistikView(),     // Halaman Statistik
    NewsView(),         // Halaman Berita
    ProfileMainView(),  // Halaman Profil
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if (index == 0) {
        Get.toNamed(AppRoutes.pemasukan);
      }
      if (index == 2) {
        Get.toNamed(AppRoutes.berita);
      }
      if (index == 3) {
        Get.toNamed(AppRoutes.profile);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<ProfileController>(() => ProfileController());
    final controller = Get.find<ProfileController>();
    final authController = Get.find<ProfileController>(); // Find AuthController

    return Scaffold(
      appBar: AppBar(
        title: Text("Profil", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              Obx(() => Text(
                controller.name.value.isEmpty ? "Nama belum diisi" : controller.name.value,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Nama Panggilan'),
                subtitle: Obx(() => Text(controller.name.value.isEmpty ? "Tidak ada nama" : controller.name.value)),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _showEditNameBottomSheet(context, controller);
                  },
                ),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text('Email'),
                subtitle: Obx(() => Text(controller.email.value.isEmpty ? "Tidak ada email" : controller.email.value)),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _showEditEmailBottomSheet(context, controller);
                  },
                ),
              ),
              ListTile(
                leading: Icon(Icons.language),
                title: Text('Bahasa'),
                subtitle: Obx(() => Text(controller.language.value.isEmpty ? "Tidak ada bahasa" : controller.language.value)),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _showEditLanguageBottomSheet(context, controller);
                  },
                ),
              ),
              // Bagian PIN
              ListTile(
                leading: Icon(Icons.lock),
                title: Text('PIN'),
                subtitle: Obx(() => Text(controller.pin.value.isEmpty ? "Tidak ada PIN" : controller.pin.value)),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _showEditPinBottomSheet(context, controller);
                  },
                ),
              ),
              // Bagian Password
              ListTile(
                leading: Icon(Icons.lock_outline),
                title: Text('Password'),
                subtitle: Obx(() => Text(controller.password.value.isEmpty ? "Tidak ada password" : "********")), // Menyembunyikan password
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _showEditPasswordBottomSheet(context, controller);
                  },
                ),
              ),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.red),
                title: Text('Logout', style: TextStyle(color: Colors.red)),
                onTap: () {
                  authController.logout();
                },
              )
            ],
          ),
        ),
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

  void _showEditNameBottomSheet(BuildContext context, ProfileController controller) {
    TextEditingController nameController = TextEditingController(text: controller.name.value);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
            top: 16.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Edit Nama Panggilan",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Nama",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.deleteName();
                      Get.back(); // Tutup bottom sheet setelah aksi
                    },
                    child: Text("Hapus"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (nameController.text.isNotEmpty) {
                        controller.editName(nameController.text); // Memperbarui nama
                        Get.back(); // Tutup bottom sheet setelah menyimpan
                      } else {
                        Get.snackbar(
                          "Error",
                          "Nama tidak boleh kosong!",
                          backgroundColor: Colors.blue,
                          colorText: Colors.white,
                        );
                      }
                    },
                    child: Text("Simpan"),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _showEditEmailBottomSheet(BuildContext context, ProfileController controller) {
    TextEditingController emailController = TextEditingController(text: controller.email.value);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
            top: 16.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Edit Email",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.deleteEmail(); // Menghapus email
                      Get.back(); // Tutup bottom sheet setelah aksi
                    },
                    child: Text("Hapus"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Ubah warna tombol Hapus
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (emailController.text.isNotEmpty) {
                        controller.editEmail(emailController.text); // Memperbarui email
                        Get.back(); // Tutup bottom sheet setelah menyimpan
                      } else {
                        Get.snackbar(
                          "Error",
                          "Email tidak boleh kosong!",
                          backgroundColor: Colors.blue,
                          colorText: Colors.white,
                        );
                      }
                    },
                    child: Text("Simpan"),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _showEditLanguageBottomSheet(BuildContext context, ProfileController controller) {
    TextEditingController languageController = TextEditingController(text: controller.language.value);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
            top: 16.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Edit Bahasa",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: languageController,
                decoration: InputDecoration(
                  labelText: "Bahasa",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.deleteLanguage(); // Menghapus bahasa
                      Get.back(); // Tutup bottom sheet setelah aksi
                    },
                    child: Text("Hapus"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Ubah warna tombol Hapus
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (languageController.text.isNotEmpty) {
                        controller.editLanguage(languageController.text); // Memperbarui bahasa
                        Get.back(); // Tutup bottom sheet setelah menyimpan
                      } else {
                        Get.snackbar(
                          "Error",
                          "Bahasa tidak boleh kosong!",
                          backgroundColor: Colors.blue,
                          colorText: Colors.white,
                        );
                      }
                    },
                    child: Text("Simpan"),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _showEditPinBottomSheet(BuildContext context, ProfileController controller) {
    TextEditingController pinController = TextEditingController(text: controller.pin.value);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
            top: 16.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Edit PIN",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: pinController,
                decoration: InputDecoration(
                  labelText: "PIN",
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.deletePin(); // Menghapus PIN
                      Get.back(); // Tutup bottom sheet setelah aksi
                    },
                    child: Text("Hapus"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Ubah warna tombol Hapus
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (pinController.text.isNotEmpty) {
                        controller.editPin(pinController.text); // Memperbarui PIN
                        Get.back(); // Tutup bottom sheet setelah menyimpan
                      } else {
                        Get.snackbar(
                          "Error",
                          "PIN tidak boleh kosong!",
                          backgroundColor: Colors.blue,
                          colorText: Colors.white,
                        );
                      }
                    },
                    child: Text("Simpan"),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _showEditPasswordBottomSheet(BuildContext context, ProfileController controller) {
    TextEditingController passwordController = TextEditingController(text: controller.password.value);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
            top: 16.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Edit Password",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.deletePassword(); // Menghapus password
                      Get.back(); // Tutup bottom sheet setelah aksi
                    },
                    child: Text("Hapus"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Ubah warna tombol Hapus
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (passwordController.text.isNotEmpty) {
                        controller.editPassword(passwordController.text); // Memperbarui password
                        Get.back(); // Tutup bottom sheet setelah menyimpan
                      } else {
                        Get.snackbar(
                          "Error",
                          "Password tidak boleh kosong!",
                          backgroundColor: Colors.blue,
                          colorText: Colors.white,
                        );
                      }
                    },
                    child: Text("Simpan"),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class PemasukanMainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Pemasukan/pengeluaran"));
  }
}

class StatistikView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Statistik View"));
  }
}

class NewsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Berita View"));
  }
}

class ProfileMainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Profile Main View"));
  }
  }