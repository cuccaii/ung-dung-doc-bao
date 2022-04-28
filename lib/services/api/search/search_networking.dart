import 'package:http/http.dart' as http;
import 'dart:convert';

//import 'search_model.dart';
import 'package:flutter_newspaper_reading_app/services/api/model/model_api.dart';

class ApiService {
  var client = http.Client();
  Future<News?> getSearch(String search) async {
    var response = await client.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=$search&apiKey=6cc819ee385f435ea7aafbcaab8bde06'));
    if (response.statusCode == 200) {
      return newsFromJson(response.body);
    }
  }
}
