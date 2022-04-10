import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:traux_challenger/app/data/models/movie.dart';
import 'package:traux_challenger/app/data/repositories/details_repository.dart';

class DetailsController extends GetxController{
  late final DetailsRepository _detailsRepository;
  DetailsController({required DetailsRepository detailsRepository}) {
    _detailsRepository = detailsRepository;
  }

  RxBool isLoading = false.obs;
  late Movie movie;

  Future<void> fetchMovie(int id) async {
     isLoading(true);
     movie = await _detailsRepository.fetchMovie(id);
     isLoading(false);
  }

  String convertRuntime(){
    if(movie.runtime != null) {
      String hours = (movie.runtime! / 60).toStringAsFixed(2);
      if(hours.split(".").length > 1) {
        return "${hours.split(".")[0]}h ${hours.split(".")[1]} min";
      }
    } return "";
  }

  // Limita a quantidade de categorias na view

  int getCategories() {
    if(movie.genres!.isEmpty) {
      return 0;
    } else if(movie.genres!.length == 1) {
      return 1;
    } else if(movie.genres!.length == 2) {
      return 2;
    } else if(movie.genres!.length >= 3 ){
      return 3;
    }else {
      return 0;
    }
  }

  String getCompanies() {
    String companies = "";
    for (var element in movie.productionCompanies!) {
      if(element == movie.productionCompanies!.last) {
        companies += element.name;
      } else {
        companies += "${element.name}, ";
      }
    }
    return companies;
  }

  String getDirectors() {
    String directors = "";
    for (var element in movie.credits!.directors) {
      if(element == movie.credits!.directors.last) {
        directors += element.name;
      } else {
        directors += "${element.name}, ";
      }
    }
    return directors;
  }


  // Limita a quantidade de pessoal do elenco na view
  String getCast() {
    String cast = "";
    int middle = movie.credits!.cast.length <= 10 ?
    movie.credits!.cast.length - 1 : (movie.credits!.cast.length / 2).round();

    for (var i = 0; i <= middle; i++) {
      if(movie.credits!.cast[i] == movie.credits!.cast[middle]) {
        cast += movie.credits!.cast[i].name;
      } else {
        cast += "${movie.credits!.cast[i].name}, ";
      }
    }
    return cast;
  }

  String formatCurrency() {
    return NumberFormat.simpleCurrency().format(movie.budget);
  }

}