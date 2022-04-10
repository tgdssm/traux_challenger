import 'package:test/test.dart';
import 'package:traux_challenger/app/data/clients/dio_implement.dart';
import 'package:traux_challenger/app/data/models/movie.dart';
import 'package:traux_challenger/app/data/models/page.dart';
import 'package:traux_challenger/app/data/providers/request_api.dart';

void main() {
  final requestAPI = RequestAPI(myHttpService: DioImplement());

  test('Deve retornar uma pagina sem erros', () async {
    expect(await requestAPI.fetchMovies(1), isA<Page>());
  });
  
  test('Deve retornar um filme sem erros', () async {
    expect(await requestAPI.fetchMovie(675353), isA<Movie>());
  });
  
}