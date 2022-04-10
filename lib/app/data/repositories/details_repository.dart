import '../models/movie.dart';
import '../providers/request_api.dart';

class DetailsRepository {
  late final RequestAPI _requestApi;

  DetailsRepository({required myHttpService}) {
    _requestApi = RequestAPI(myHttpService: myHttpService);
  }

  Future<Movie> fetchMovie(int id) {
    return _requestApi.fetchMovie(id);
  }
}