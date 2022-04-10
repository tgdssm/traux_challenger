import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:traux_challenger/app/controllers/details_controller.dart';
import 'package:traux_challenger/app/data/clients/dio_implement.dart';
import 'package:traux_challenger/app/data/repositories/details_repository.dart';

class DetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailsController(detailsRepository: DetailsRepository(myHttpService: DioImplement())));
  }

}