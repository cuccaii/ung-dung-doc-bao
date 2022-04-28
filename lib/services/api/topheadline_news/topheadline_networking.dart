//import 'package:flutter_newspaper_reading_app/services/api/topheadline_news/topheadline_model.dart';

import 'package:http/http.dart' as http;

import '../model/model_api.dart';

class TopHeadlineService {
  var client = http.Client();
  Future<News?> getHeadline() async {
    var response = await client.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=6cc819ee385f435ea7aafbcaab8bde06'));
    if (response.statusCode == 200) {
      return newsFromJson(response.body);
    }
  }
}
