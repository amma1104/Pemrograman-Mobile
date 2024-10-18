import 'package:get/get.dart';

class HomeController extends GetxController {
  // You can add reactive state variables here
  var message = "Hidup Chill\nCuan Tetap Stabil!".obs;


  // Method to handle button press for navigation
  void onStartPressed() {
    Get.toNamed('/pemasukan'); // Navigate to the Pemasukan page
  }
}


