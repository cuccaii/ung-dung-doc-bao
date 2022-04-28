import 'package:http/http.dart' as http;

import '../model/model_api.dart';

class EverythingService {
  var client = http.Client();
  Future<News?> getNews() async {
    var response = await client.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=apple&from=2022-04-26&to=2022-04-26&sortBy=popularity&apiKey=6cc819ee385f435ea7aafbcaab8bde06'));
    if (response.statusCode == 200) {
      return newsFromJson(response.body);
    }
  }
}
