import 'package:test/test.dart';
import 'package:traux_challenger/app/data/clients/dio_implement.dart';
import 'package:traux_challenger/app/data/clients/http_implement.dart';
import 'package:traux_challenger/app/data/models/credits.dart';
import 'package:traux_challenger/app/data/models/movie.dart';
import 'package:traux_challenger/app/data/providers/request_api.dart';

void main() {
  final requestAPI = RequestAPI(myHttpService: HttpImplement());
  // final requestAPI = RequestAPI(myHttpService: DioImplement());

  test('Deve retornar uma pagina sem erros', () async {
    expect(await requestAPI.fetchMovies(1), isA<List<Movie>>());
  });
  
  test('Deve retornar um filme sem erros', () async {
    expect(await requestAPI.fetchMovie(675353), isA<Movie>());
  });

  test('Deve retornar uma lista de filmes que contem os caracteres pesquisas', ()async{
    expect(await requestAPI.searchMovies("Mega", 1), isA<List<Movie>>());
  });

  test('Deve retonar os creditos do filme', ()async{
    expect(await requestAPI.fetchCredits(675353), isA<Credits>());
  });
}