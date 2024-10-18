import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugasteori1/app/modules/berita/Views/berita_view.dart';
import 'package:tugasteori1/app/modules/berita/controllers/berita_controller.dart';
import 'package:tugasteori1/app/modules/beritanull/controllers/beritanull_controller.dart';
import 'package:tugasteori1/app/modules/beritanull/views/beritanull_view.dart';
import 'package:tugasteori1/app/modules/home/controllers/home_controller.dart';
import 'package:tugasteori1/app/modules/home/views/home_view.dart';
import 'package:tugasteori1/app/modules/pemasukan/controllers/pemasukan_controller.dart';
import 'package:tugasteori1/app/modules/pemasukan/views/pemasukan_view.dart';
import 'package:tugasteori1/app/modules/pemasukannull/views/pemasukannull_view.dart';
import 'package:tugasteori1/app/modules/pengeluaran/controllers/pengeluaran_controller.dart';
import 'package:tugasteori1/app/modules/pengeluaran/views/pengeluaran_view.dart';
import 'package:tugasteori1/app/modules/pengeluarannull/views/pengeluarannull_view.dart';
import 'package:tugasteori1/app/modules/profile/views/profile_view.dart';
import 'package:tugasteori1/app/modules/profilenull/views/profilenull_view.dart';
import 'package:tugasteori1/firebase_options.dart';
import 'package:tugasteori1/notification_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Get.putAsync(() async => await SharedPreferences.getInstance());
  await FirebaseMessagingHandler().initPushNotification();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<PemasukanController>(() => PemasukanController());
    Get.lazyPut<PengeluaranController>(() => PengeluaranController());
    Get.lazyPut<BeritaController>(() => BeritaController());
    Get.lazyPut<BeritanullController>(() => BeritanullController());
    return GetMaterialApp(

      title: 'Your App',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomeView()), // Main Page
        GetPage(name: '/pemasukan', page: () => PemasukanView()),
        GetPage(name: '/pengeluaran', page: () => PengeluaranView()),
        GetPage(name: '/pemasukannull', page: () => PemasukannullView()),
        GetPage(name: '/pengeluarannull', page: () => PengeluarannullView()),
        GetPage(name: '/profile', page: () => ProfileView()),
        GetPage(name: '/profilenull', page: () => ProfilenullView()),
        GetPage(name: '/berita', page: () => BeritaView()),
        GetPage(name: '/beritanull', page: () => BeritanullView())
      ],
    );
  }
}

