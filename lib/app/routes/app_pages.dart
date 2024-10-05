import 'package:get/get.dart';
import 'package:tugasteori1/app/modules/home/bindings/home_binding.dart';
import 'package:tugasteori1/app/modules/home/views/home_view.dart';
import 'package:tugasteori1/app/modules/pemasukan/bindings/pemasukan_binding.dart';
import 'package:tugasteori1/app/modules/pemasukan/views/pemasukan_view.dart';
import 'package:tugasteori1/app/modules/pemasukannull/bindings/pemasukannull_binding.dart';
import 'package:tugasteori1/app/modules/pemasukannull/views/pemasukannull_view.dart';
import 'package:tugasteori1/app/modules/pengeluaran/bindings/pengeluaran_binding.dart';
import 'package:tugasteori1/app/modules/pengeluaran/views/pengeluaran_view.dart';
import 'package:tugasteori1/app/modules/pengeluarannull/bindings/pengeluarannull_binding.dart';
import 'package:tugasteori1/app/modules/pengeluarannull/views/pengeluarannull_views.dart';
import 'package:tugasteori1/app/modules/profile/bindings/profile_bindings.dart';
import 'package:tugasteori1/app/modules/profile/views/profile_view.dart';
import 'app_routes.dart';

class AppPages {
  static const String pemasukan = '/pemasukan';
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(), // Define the HomeView as the first page
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.pemasukan,
      page: () => PemasukanView(), // Define the PemasukanView for the second page
      binding: PemasukanBinding(),
    ),
    GetPage(
      name: AppRoutes.pengeluaran,
      page: () => PengeluaranView(),
      binding: PengeluaranBinding(),
    ),
    GetPage(
      name: AppRoutes.pemasukannull,
      page: () => PemasukannullView(),
      binding: PemasukannullBinding(),
    ),
    GetPage(
      name: AppRoutes.pengeluarannull,
      page: () => PengeluarannullView(),
      binding: PengeluarannullBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}


