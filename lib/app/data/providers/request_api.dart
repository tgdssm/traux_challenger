import 'package:traux_challenger/app/data/clients/my_http_service.dart';
import 'package:traux_challenger/app/utils/globals.dart';

import '../models/genre.dart';
import '../models/movie.dart';

const API_KEY = "7d15c2a5cbb8f4ea7a65a68be388ec59";
const BASE_URL = "https://api.themoviedb.org/3/movie/popular";

class RequestAPI {
  late MyHttpService myHttpService;
  RequestAPI({required this.myHttpService});

  Future<List<Movie>> fetchMovies(int page) async {
    if(globalGenres.isEmpty) {
      globalGenres = await _fetchGenres();
    }


    List<Movie> movies = [];
    final response = await myHttpService.get("$BASE_URL?page=$page&api_key=$API_KEY");

    if(response != null) {
      movies = Movie.fromJsonToList(response['results']);
      lastPage = response['total_pages'];
    }
    return movies;
  }

  Future<List<Movie>> searchMovies(String movieName) async {
    List<Movie> movies = [];
    final response = await myHttpService.get("https://api.themoviedb.org/3/search/movie?api_key=$API_KEY&query=$movieName");

    if(response != null) {
      movies = Movie.fromJsonToList(response['results']);
      lastPage = response['total_pages'];
    }
    return movies;
  }

  Future<Movie> fetchMovie(int id)async {
    late Movie movie;
    final response = await myHttpService.get("https://api.themoviedb.org/3/movie/$id?api_key=$API_KEY");
    if(response != null) {
      movie = Movie.fromJson(response as Map<String, dynamic>);
    }
    return movie;
  }
  

  Future<List<Genre>> _fetchGenres() async {
    List<Genre> genres = [];
    final response = await myHttpService.get("https://api.themoviedb.org/3/genre/movie/list?api_key=$API_KEY");
    response['genres'].forEach((genre){
      genres.add(Genre.fromJson(genre as Map<String, dynamic>));
    });
    return genres;
  }

}