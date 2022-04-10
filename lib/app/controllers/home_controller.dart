import 'package:get/get.dart';
import 'package:traux_challenger/app/data/repositories/home_repository.dart';

class HomeController extends GetxController {
  late final HomeRepository _homeRepository;
  HomeController({required HomeRepository homeRepository}) {
    _homeRepository = homeRepository;
  }
}