import 'package:get/get.dart';
import 'package:traux_challenger/app/controllers/home_controller.dart';
import 'package:traux_challenger/app/data/clients/dio_implement.dart';
import 'package:traux_challenger/app/data/repositories/home_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(homeRepository: HomeRepository(myHttpService: DioImplement())));
  }

}