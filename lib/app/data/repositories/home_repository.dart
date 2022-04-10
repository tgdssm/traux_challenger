import '../clients/my_http_service.dart';
import '../models/movie.dart';
import '../models/page.dart';
import '../providers/request_api.dart';

class HomeRepository {
  late final MyHttpService myHttpService;
  late final RequestAPI _requestApi;

  HomeRepository({required this.myHttpService}) {
    _requestApi = RequestAPI(myHttpService: myHttpService);
  }

  Future<List<Movie>> fetchMovies(int page) async {
    return _requestApi.fetchMovies(page);
  }
}