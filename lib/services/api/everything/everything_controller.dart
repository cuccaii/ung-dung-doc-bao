import 'package:get/get.dart';

import '../model/model_api.dart';
import 'everything_networking.dart';

class EverythingController extends GetxController {
  var newsList = List<Article>.empty().obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    getheadline();
  }

  void getheadline() async {
    var news = await EverythingService().getNews();
    try {
      if (news != null) {
        newsList.addAll(news.articles!);
      }
    } finally {
      isLoading(false);
    }
  }
}
