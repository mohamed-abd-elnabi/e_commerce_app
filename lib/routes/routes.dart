import 'package:flutter/material.dart';
import 'package:shop_avatar/core/resources/manager_strings.dart';
import '../features/auth/presentation/view/authentication.dart';
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
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splachScreen:
        return MaterialPageRoute(builder: (_) => const SplachScreen());
      case Routes.outBoarding:
        return MaterialPageRoute(builder: (_) => const OutBoarding());
      case Routes.authScreen:
        return MaterialPageRoute(builder: (context) => const Authentication());
      case Routes.loginView:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case Routes.registerView:
        return MaterialPageRoute(builder: (context) => const RegisterView());
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
