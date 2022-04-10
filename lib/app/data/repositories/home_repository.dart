import '../models/movie.dart';
import '../providers/request_api.dart';

class HomeRepository {
  late final RequestAPI _requestApi;

  HomeRepository({required myHttpService}) {
    _requestApi = RequestAPI(myHttpService: myHttpService);
  }

  Future<List<Movie>> fetchMovies(int page) async {
    return _requestApi.fetchMovies(page);
  }

  Future<List<Movie>> searchMovies(String movieName, int page) async {
    return _requestApi.searchMovies(movieName, page);
  }
}