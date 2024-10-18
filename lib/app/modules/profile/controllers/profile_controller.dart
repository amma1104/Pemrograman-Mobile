import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tugasteori1/app/routes/app_routes.dart';

class ProfileController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth
      .instance;
  final FirebaseFirestore _firestore = FirebaseFirestore
      .instance;

  String? _currentUserId;
  var name = ''.obs;
  var email = ''.obs;
  var language = ''.obs;
  var pin = ''.obs;
  var password = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getUserData();
  }

  void getUserData() async {
    email.value = _auth.currentUser?.email ?? '';
    print("Current User Email: ${email.value}");

    try {
      DocumentSnapshot userDoc = await _firestore.collection('data_profile')
          .doc(_auth.currentUser?.uid)
          .get();
      if (userDoc.exists) {
        var data = userDoc.data() as Map<String, dynamic>;
        name.value = data['name'] ?? '';
        pin.value = data['pin'] ?? '';
        language.value = data['bahasa'] ?? '';
        password.value = data ['passowrd'] ?? '';
        print("User Data: $data");
      } else {
        print("User document does not exist.");
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

  void logout() async {
    try {
      await _auth.signOut();
      Get.toNamed(AppRoutes.home);
    } catch (e) {
      print("Error during logout: $e");
    }
  }

    void resetUserData() {
    name.value = '';
    email.value = '';
    language.value = '';
    pin.value = '';
    password.value = '';
  }

  Future<void> saveUserData() async {
    print("Saving user data: ${name.value}, ${email.value}, ${language
        .value}, ${pin.value}, ${password.value}");
    await _firestore.collection('data_profile').doc(_auth.currentUser?.uid).set(
        {
          'name': name.value,
          'email': email.value,
          'bahasa': language.value,
          'pin': pin.value,
          'password': password.value
        });
  }

  void editName(String newName) {
    name.value = newName;
    saveUserData();
  }

  void deleteName() {
    name.value = '';
    saveUserData();
  }

  void editEmail(String newEmail) {
    print("Email updated: $newEmail");
    email.value = newEmail;
    saveUserData();
  }

  void deleteEmail() {
    email.value = '';
    saveUserData();
  }

  void editLanguage(String newLanguage) {
    language.value = newLanguage;
    saveUserData();
  }

  void deleteLanguage() {
    language.value = '';
    saveUserData();
  }

  void editPin(String newPin) {
    pin.value = newPin;
    saveUserData();
  }

  void deletePin() {
    pin.value = '';
    saveUserData();
  }

  void editPassword(String newPassword) {
    print("Password updated: $newPassword");
    password.value = newPassword;
    saveUserData();
  }

  void deletePassword() {
    password.value = '';
    saveUserData();
  }

  Future<void> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      String? newUserId = userCredential.user?.uid;

      DocumentSnapshot userDoc = await _firestore.collection('data_profile')
          .doc(newUserId)
          .get();

      if (!userDoc.exists) {
        name.value = 'Nama Default';
        language.value =
        'Bahasa Default';
        pin.value = '0000';

        await _firestore.collection('data_profile').doc(newUserId).set({
          'name': name.value,
          'email': email,
          'bahasa': language.value,
          'pin': pin.value,
        });

        print("New user data saved for user ID: $newUserId");
      } else {

        getUserData();
      }

            _currentUserId = newUserId;

      Get.toNamed(AppRoutes.profile);
    } catch (e) {
      print("Login error: $e");
    }
  }
}

