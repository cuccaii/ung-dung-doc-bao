import 'dart:convert';
//import 'package:flutter_newspaper_reading_app/services/api/topheadline_news/topheadline_model.dart';

import 'package:flutter_newspaper_reading_app/services/api/topheadline_news/topheadline_networking.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../model/model_api.dart';

class TopHeadlineController extends GetxController {
  var headlineList = List<Article>.empty().obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    getheadline();
  }

  void getheadline() async {
    var headline = await TopHeadlineService().getHeadline();
    try {
      if (headline != null) {
        headlineList.addAll(headline.articles!);
      }
    } finally {
      isLoading(false);
    }
  }
}
