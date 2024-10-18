import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:tugasteori1/app/modules/home/controllers/home_controller.dart';
import 'package:tugasteori1/app/routes/app_routes.dart';

class HomeView extends GetView<HomeController> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Firebase Auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Local Notifications instance
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  // Initialize the notifications
  Future<void> initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
    InitializationSettings(
      android: initializationSettingsAndroid,
    );

    // No longer passing onSelectNotification here
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      // You may need to handle notifications in your app lifecycle.
    );
  }

  // Show notification function for foreground
  Future<void> showNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );

    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await _flutterLocalNotificationsPlugin.show(
      0,
      'Login Berhasil',
      'Anda telah berhasil login ke aplikasi',
      platformChannelSpecifics,
      payload: 'Notification Payload',
    );
  }

  @override
  Widget build(BuildContext context) {
    initializeNotifications(); // Initialize notifications when the widget is built

    return Scaffold(
      body: Stack(
        children: [
          // Blue background
          Container(
            color: Colors.blue,
          ),
          // Positioned Image
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Image.asset(
              'lib/img.png', // Ensure this path is correct
              height: 500,
              fit: BoxFit.contain,
            ),
          ),
          // White container at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Main message
                  Obx(() => Text(
                    controller.message.value,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  )),
                  SizedBox(height: 10),
                  Text(
                    "Atur dan Kelola Duitlu\ndengan gampang pakai Aplikasi ini",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  // Login Button
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        _showLoginModal(context);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor: Colors.blue,
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Register Button
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        _showRegisterModal(context);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor: Colors.blue,
                      ),
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to show the login modal
  void _showLoginModal(BuildContext context) {
    _emailController.clear();
    _passwordController.clear();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 20,
              right: 20,
              top: 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Email input
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "example@gmail.com",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.email),
                  ),
                  autofocus: true,
                ),
                SizedBox(height: 20),
                // Password input
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                SizedBox(height: 20),
                // OK Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      String email = _emailController.text.trim();
                      String password = _passwordController.text.trim();
                      if (email.isEmpty || password.isEmpty) {
                        Get.snackbar("Error", "Email and password cannot be empty!",
                            backgroundColor: Colors.red, colorText: Colors.white);
                        return;
                      }
                      try {
                        await _auth.signInWithEmailAndPassword(
                          email: email,
                          password: password,
                        );
                        Navigator.pop(context);
                        // Show notification when login is successful
                        await showNotification();
                        Get.toNamed(AppRoutes.pemasukan);
                      } catch (e) {
                        Get.snackbar("Login Failed", e.toString(),
                            backgroundColor: Colors.red, colorText: Colors.white);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.blue,
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 18),
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

  // Function to show the register modal
  void _showRegisterModal(BuildContext context) {
    _emailController.clear();
    _passwordController.clear();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 20,
              right: 20,
              top: 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Email input
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "example@gmail.com",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.email),
                  ),
                  autofocus: true,
                ),
                SizedBox(height: 20),
                // Password input
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                SizedBox(height: 20),
                // OK Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      String email = _emailController.text.trim();
                      String password = _passwordController.text.trim();
                      if (email.isEmpty || password.isEmpty) {
                        Get.snackbar("Error", "Email and password cannot be empty!",
                            backgroundColor: Colors.red, colorText: Colors.white);
                        return;
                      }
                      try {
                        await _auth.createUserWithEmailAndPassword(
                          email: email,
                          password: password,
                        );
                        Navigator.pop(context);
                        Get.snackbar("Register Success", "Account created successfully!",
                            backgroundColor: Colors.green, colorText: Colors.white);
                      } catch (e) {
                        Get.snackbar("Register Failed", e.toString(),
                            backgroundColor: Colors.red, colorText: Colors.white);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.blue,
                    ),
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.white, fontSize: 18),
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
}
