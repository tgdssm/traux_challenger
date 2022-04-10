import 'package:dio/dio.dart';
import 'package:traux_challenger/app/data/clients/my_http_service.dart';

class DioImplement implements MyHttpService {
  final dio = Dio();

  @override
  Future<dynamic> get(String url) async {
    final response = await dio.get(url);
    if(response.statusCode == 200) {
      return response.data;
    } else {
      return null;
    }
  }

}