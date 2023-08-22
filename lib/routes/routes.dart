import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_avatar/config/localization/dependancy_injection.dart';
import 'package:shop_avatar/core/resources/manager_strings.dart';
import 'package:shop_avatar/features/auth/presentation/controller/auth_controller.dart';
import '../features/auth/presentation/view/authentication.dart';
import '../features/home.dart';
import '../features/out_boarding/presentation/view/out_boarding_screen.dart';
import '../features/auth/presentation/view/login_view.dart';
import '../features/auth/presentation/view/register.dart';
import '../features/splach/presentation/view/splach_screen.dart';

class Routes {
  static const String splachScreen = '/splach_screen';
  static const String outBoarding = '/out_boarding';
  static const String mainScreen = '/main_screen';
  static const String authScreen = '/authentication_screen';
  static const String loginView = '/loginview_screen';
  static const String registerView = '/register_screen';
  static const String homePage = '/home_screen';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splachScreen:
        return MaterialPageRoute(builder: (_) => const SplachScreen());
      case Routes.outBoarding:
        return MaterialPageRoute(builder: (_) => const OutBoarding());
      case Routes.authScreen:
        initAuth();
        return MaterialPageRoute(builder: (context) => const Authentication());
      case Routes.loginView:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case Routes.registerView:
        return MaterialPageRoute(builder: (context) => const RegisterView());
      case Routes.homePage:
        disposeAuth();

        return MaterialPageRoute(builder: (context) => const HomePage());
      default:
        return unDefindRout();
    }
  }

  static Route<dynamic> unDefindRout() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text(ManagerStrings.notFoundRoute),
        ),
      ),
    );
  }
}
// routes: {
// Routes.splashScreen: (context) => const SplashScreen(),
// Routes.outBoarding: (context) => const OutBoarding(),
// Routes.authScreen: (context) => const Authentication(),
// Routes.loginView: (context) => const LoginView(),
// Routes.registerView: (context) => const RegisterView(),
// },
