import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_avatar/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: Routes.splachScreen,
      onGenerateRoute: RouteGenerator.getRoute,
      //   routes: {
      //     Routes.splachScreen: (context) => const SplachScreen(),
      //     Routes.outBoarding: (context) => const OutBoarding(),
      //     Routes.authScreen: (context) => const Authentication(),
      //     Routes.loginView: (context) => const LoginView(),
      //     Routes.registerView: (context) => const RegisterView(),
      //   },
    );
  }
}
