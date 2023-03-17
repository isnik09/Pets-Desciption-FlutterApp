import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pets_app_mvvm/Components/themeData.dart';
import 'package:pets_app_mvvm/Utils/Routes/routeNames.dart';
import 'package:pets_app_mvvm/Utils/Routes/routes.dart';

void main() {
  ThemeData(
    useMaterial3: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: const Color(0x00000000),
      ),
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.splash,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
