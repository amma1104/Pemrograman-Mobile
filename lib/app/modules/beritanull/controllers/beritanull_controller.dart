import 'package:get/get.dart';
import 'package:tugasteori1/app/modules/beritanull/models/beritanull_model.dart';
import 'package:tugasteori1/app/modules/beritanull/services/beritanull_service.dart';

class BeritanullController extends GetxController {
  var beritaList = <BeritanullModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchBerita();
    super.onInit();
  }

  void fetchBerita() async {
    try {
      isLoading(true);
      var berita = await BeritanullService.fetchBerita();
      beritaList.assignAll(berita);
    } finally {
      isLoading(false);
    }
  }
}
