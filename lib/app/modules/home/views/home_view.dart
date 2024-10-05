import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugasteori1/app/modules/home/controllers/home_controller.dart';
import 'package:tugasteori1/app/routes/app_routes.dart';

class HomeView extends GetView<HomeController> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Blue background
          Container(
            color: Colors.blue, // Background color
          ),

          Positioned(
            top: 100, // Position image closer to the bottom
            left: 0,
            right: 0,
            child: Image.asset(
              'lib/img.png', // Replace with correct asset path
              height: 500, // Adjust the height if needed
              fit: BoxFit.contain,
            ),
          ),
          // White container at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.5, // Adjusted height for more buttons
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
                    width: 200, // Ensures all buttons are the same width
                    child: ElevatedButton(
                      onPressed: () {
                        _showLoginModal(context); // Show pop-up login modal
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15), // Same height for all buttons
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
                  SizedBox(height: 40),

                  // Ayo Mulai Button
                  SizedBox(
                    width: 250, // Ensures all buttons are the same width
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.pemasukannull);
                        // Navigate to PemasukanNull page
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15), // Same height for all buttons
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor: Colors.blue,
                      ),
                      child: Text(
                        "Ayo Mulai!!!",
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

  // Function to show the login modal pop-up
  void _showLoginModal(BuildContext context) {
    // Automatically open the keyboard when the pop-up appears
    FocusScope.of(context).requestFocus(FocusNode());

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Ensures the modal can be scrolled
      backgroundColor: Colors.white, // Sets background of the modal to white
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
            left: 20,
            right: 20,
            top: 20,
          ),
          child: SingleChildScrollView( // Ensure content can be scrolled when keyboard is visible
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Email input field
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress, // Ensures correct input type for email
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "example@gmail.com",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.email),
                  ),
                  autofocus: true, // Automatically focuses the email input field
                ),
                SizedBox(height: 20),

                // Password input field
                TextField(
                  controller: _passwordController,
                  obscureText: true, // Hides the password
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

                // OK button, will move up when keyboard shows
                SizedBox(
                  width: double.infinity, // Button takes the full width
                  child: ElevatedButton(
                    onPressed: () {
                      String email = _emailController.text;
                      String password = _passwordController.text;

                      // Check if email ends with "@gmail.com"
                      if (!email.endsWith("@gmail.com")) {
                        Get.snackbar(
                          "Error",
                          "Email harus menggunakan domain @gmail.com!",
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                        return;
                      }

                      // Check if password is at least 8 characters long
                      if (password.length < 8) {
                        Get.snackbar(
                          "Error",
                          "Password harus minimal 8 karakter!",
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                        return;
                      }

                      if (email.isNotEmpty && password.isNotEmpty) {
                        // Perform login logic here, such as checking credentials
                        print("Email: $email, Password: $password");
                        Navigator.pop(context); // Close the modal
                        Get.toNamed(AppRoutes.pemasukan); // Navigate to the Pemasukan page
                      } else {
                        // Show error message
                        Get.snackbar(
                          "Error",
                          "Email dan password harus diisi!",
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15), // Button height
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.blue,
                    ),
                    child: Text(
                      "OK",
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
