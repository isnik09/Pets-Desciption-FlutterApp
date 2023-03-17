import 'package:flutter/material.dart';
import 'package:pets_app_mvvm/Utils/Routes/routes.dart';
import 'package:pets_app_mvvm/Views/descriptionScreen.dart';
import 'package:pets_app_mvvm/Views/homeScreen.dart';
import 'package:pets_app_mvvm/Views/splashScreen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // HOMESCREEN
      case RouteNames.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());

      // SPLASHSCREEN
      case RouteNames.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());

      // DESCRIPTIONSCREEN
      // case RouteNames.desc:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const DescriptionScreen());
      // DEFAULTS TO PAGE UNAVAILABLE
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("Page Unavailable"),
            ),
          );
        });
    }
  }
}
