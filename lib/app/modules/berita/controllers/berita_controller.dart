import 'package:get/get.dart';
import 'package:tugasteori1/app/modules/berita/models/berita_model.dart';
import 'package:tugasteori1/app/modules/berita/services/berita_service.dart';

class BeritaController extends GetxController {
  var beritaList = <BeritaModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchBerita();
    super.onInit();
  }

  void fetchBerita() async {
    try {
      isLoading(true);
      var berita = await BeritaService.fetchBerita();
      beritaList.assignAll(berita);
    } finally {
      isLoading(false);
    }
  }
}
