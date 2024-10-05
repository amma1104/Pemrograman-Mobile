import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugasteori1/app/modules/home/controllers/home_controller.dart';
import 'package:tugasteori1/app/modules/home/views/home_view.dart';
import 'package:tugasteori1/app/modules/pemasukan/controllers/pemasukan_controller.dart';
import 'package:tugasteori1/app/modules/pemasukan/views/pemasukan_view.dart';
import 'package:tugasteori1/app/modules/pemasukannull/views/pemasukannull_view.dart';
import 'package:tugasteori1/app/modules/pengeluaran/controllers/pengeluaran_controller.dart';
import 'package:tugasteori1/app/modules/pengeluaran/views/pengeluaran_view.dart';
import 'package:tugasteori1/app/modules/pengeluarannull/views/pengeluarannull_views.dart';
import 'package:tugasteori1/app/modules/profile/views/profile_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<PemasukanController>(() => PemasukanController());
    Get.lazyPut<PengeluaranController>(() => PengeluaranController());
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
      ],
    );
  }
}

