import 'package:flutter/material.dart';
import 'package:shop_avatar/core/routes.dart';
import 'package:shop_avatar/features/auth/presentation/view/register.dart';
import 'package:shop_avatar/features/out_boarding/presentation/view/out_boarding_screen.dart';
import 'package:shop_avatar/features/splach/presentation/view/splach_screen.dart';

import 'features/auth/presentation/view/authentication.dart';
import 'features/auth/presentation/view/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: Routes.splachScreen,
      routes: {
        Routes.splachScreen: (context) => const SplachScreen(),
        Routes.outBoarding: (context) => const OutBoarding(),
        Routes.authScreen: (context) => const Authentication(),
        Routes.loginView: (context) => const LoginView(),
        Routes.registerView: (context) => const RegisterView(),
      },
    );
  }
}
