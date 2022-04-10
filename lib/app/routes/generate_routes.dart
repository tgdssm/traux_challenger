import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:traux_challenger/app/bindings/home_binding.dart';
import 'package:traux_challenger/app/routes/app_routes.dart';
import 'package:traux_challenger/app/ui/home/home.dart';

class GenerateRoutes{
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch(settings.name) {
      case AppRoutes.HOME:
        return GetPageRoute(
          page: () => const Home(),
          routeName: AppRoutes.HOME,
          binding: HomeBinding(),
        );
      default:
        return null;
    }
  }
}