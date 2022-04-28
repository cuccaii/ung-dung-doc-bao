// import 'package:flutter_newspaper_reading_app/services/api/search/search_model.dart';
import 'package:flutter_newspaper_reading_app/services/api/model/model_api.dart';
import 'package:flutter_newspaper_reading_app/services/api/search/search_networking.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  var searchList = List<Article>.empty(growable: true).obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getsearch();
  }

  void getsearch() async {
    var search = await ApiService().getSearch(Get.arguments);
    try {
      if (search != null) {
        searchList.addAll(search.articles!);
      }
    } finally {
      isLoading(false);
    }
  }
}
