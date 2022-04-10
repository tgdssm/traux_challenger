import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traux_challenger/app/routes/app_routes.dart';
import 'package:traux_challenger/app/routes/generate_routes.dart';

import 'app/ui/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Traux',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) => GenerateRoutes.onGenerateRoute(settings),
      initialRoute: AppRoutes.HOME,
    );
  }
}

