import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugasteori1/app/modules/profile/controllers/profile_controllers.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<ProfileController>(() => ProfileController());
    final controller = Get.find<ProfileController>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Profil"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            Obx(() => Text(
              controller.name.value.isEmpty ? "Nama belum diisi" : controller.name.value,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )),
            SizedBox(height: 20),
            // Bagian Nama
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
            // Bagian Email
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
            // Bagian Bahasa
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
          ],
        ),
      ),
    );
  }

  // Fungsi untuk menampilkan pop-up dari bawah untuk edit nama
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
                      backgroundColor: Colors.red,
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
                          backgroundColor: Colors.red,
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

  // Fungsi untuk menampilkan pop-up dari bawah untuk edit email
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
                      controller.deleteEmail();
                      Get.back(); // Tutup bottom sheet setelah aksi
                    },
                    child: Text("Hapus"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (emailController.text.isNotEmpty && emailController.text.contains('@gmail.com')) {
                        controller.editEmail(emailController.text); // Memperbarui email
                        Get.back(); // Tutup bottom sheet setelah menyimpan
                      } else {
                        Get.snackbar(
                          "Error",
                          "Email harus valid dan menggunakan @gmail.com!",
                          backgroundColor: Colors.red,
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

  // Fungsi untuk menampilkan pop-up dari bawah untuk edit bahasa
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
                      controller.deleteLanguage();
                      Get.back(); // Tutup bottom sheet setelah aksi
                    },
                    child: Text("Hapus"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
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
                          backgroundColor: Colors.red,
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

  // Fungsi untuk menampilkan pop-up dari bawah untuk edit PIN
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
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "PIN",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.deletePin();
                      Get.back(); // Tutup bottom sheet setelah aksi
                    },
                    child: Text("Hapus"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
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
                          backgroundColor: Colors.red,
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

  // Fungsi untuk menampilkan pop-up dari bawah untuk edit password
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
                "Edit Password (Maksimal 8 Karakter)",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: passwordController,
                obscureText: true,
                maxLength: 8, // Membatasi panjang password hingga 8 karakter
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.deletePassword();
                      Get.back(); // Tutup bottom sheet setelah aksi
                    },
                    child: Text("Hapus"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (passwordController.text.isNotEmpty && passwordController.text.length <= 8) {
                        controller.editPassword(passwordController.text); // Memperbarui password
                        Get.back(); // Tutup bottom sheet setelah menyimpan
                      } else {
                        Get.snackbar(
                          "Error",
                          "Password tidak boleh lebih dari 8 karakter!",
                          backgroundColor: Colors.red,
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
