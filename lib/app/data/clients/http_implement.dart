import 'dart:convert';
import 'package:traux_challenger/app/data/clients/my_http_service.dart';
import 'package:http/http.dart' as http;

class HttpImplement implements MyHttpService {

  @override
  Future<dynamic> get(String url) async {
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if(response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }

}