import 'package:get/get.dart';

class ProfileController extends GetxController {
  var name = ''.obs;
  var email = ''.obs;
  var language = ''.obs;
  var pin = ''.obs;
  var password = ''.obs; // Pastikan ini didefinisikan

  // Mengedit nama
  void editName(String newName) {
    name.value = newName;
  }

  // Menghapus nama
  void deleteName() {
    name.value = '';
  }

  // Mengedit email
  void editEmail(String newEmail) {
    email.value = newEmail;
  }

  // Menghapus email
  void deleteEmail() {
    email.value = '';
  }

  // Mengedit bahasa
  void editLanguage(String newLanguage) {
    language.value = newLanguage;
  }

  // Menghapus bahasa
  void deleteLanguage() {
    language.value = '';
  }

  // Mengedit PIN
  void editPin(String newPin) {
    pin.value = newPin;
  }

  // Menghapus PIN
  void deletePin() {
    pin.value = '';
  }

  // Mengedit password
  void editPassword(String newPassword) {
    password.value = newPassword;
  }

  // Menghapus password
  void deletePassword() {
    password.value = '';
  }
}
