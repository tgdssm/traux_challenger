import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:traux_challenger/app/data/models/movie.dart';
import 'package:traux_challenger/app/data/repositories/home_repository.dart';

class HomeController extends GetxController {
  late final HomeRepository _homeRepository;
  HomeController({required HomeRepository homeRepository}) {
    _homeRepository = homeRepository;
  }

  final searchMovies = TextEditingController();
  late final ScrollController scrollController;
  RxList<Movie> movies = <Movie>[].obs;
  int currentPage = 1;

  Future<void> fetchMovies() async {
    movies.addAll(await _homeRepository.fetchMovies(currentPage));
  }

  Future<void> fSearchMovies() async {
    currentPage = 1;
    movies.value = await _homeRepository.searchMovies(searchMovies.text, currentPage);
    scrollController.position.jumpTo(0);
  }

  // Limita a quantidade de categorias na view
  String getCategories(int index) {
    if(movies[index].genres!.isEmpty) {
      return "";
    } else if(movies[index].genres!.length == 1) {
      return movies[index].genres!.first.name.capitalizeFirst!;
    } else if(movies[index].genres!.length >= 2) {
      return "${movies[index].genres![0].name.capitalizeFirst!} - ${movies[index].genres![1].name.capitalizeFirst!}";
    } else {
      return "";
    }
  }


}