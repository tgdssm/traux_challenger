import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:traux_challenger/app/bindings/details_binding.dart';
import 'package:traux_challenger/app/bindings/home_binding.dart';
import 'package:traux_challenger/app/routes/app_routes.dart';
import 'package:traux_challenger/app/ui/home/home.dart';

import '../ui/details/details.dart';

class GenerateRoutes{
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch(settings.name) {
      case AppRoutes.HOME:
        return GetPageRoute(
          page: () => const Home(),
          routeName: AppRoutes.HOME,
          binding: HomeBinding(),
        );
      case AppRoutes.DETAILS:
        return GetPageRoute(
          page: () => Details(id: settings.arguments as int ),
          routeName: AppRoutes.DETAILS,
          binding: DetailsBinding()
        );
      default:
        return null;
    }
  }
}