import 'package:flutter/material.dart';
import 'package:shop_avatar/config/localization/dependancy_injection.dart';
import 'package:shop_avatar/core/resources/manager_strings.dart';
import 'package:shop_avatar/features/profile/presentation/view/profile_view.dart';
import '../features/about_app/presentation/view/about_view.dart';
import '../features/auth/presentation/view/authentication.dart';
import '../features/forget_password/presentation/view/forget_password_view.dart';
import '../features/forget_password/presentation/view/otb_code_verification.dart';
import '../features/home/presentation/view/home_view.dart';
import '../features/notifications/presentation/view/notifications_view.dart';
import '../features/out_boarding/presentation/view/out_boarding_screen.dart';
import '../features/auth/presentation/view/login_view.dart';
import '../features/auth/presentation/view/register.dart';
import '../features/product_details/presentation/view/product_details.dart';
import '../features/profile/presentation/view/edir_profile_view.dart';
import '../features/share_app/presentation/view/share_app.dart';
import '../features/splach/presentation/view/splach_screen.dart';
import '../features/support/presentation/view/support_view.dart';

class Routes {
  static const String splachScreen = '/splach_screen';
  static const String outBoarding = '/out_boarding';
  static const String mainScreen = '/main_screen';
  static const String authScreen = '/authentication_screen';
  static const String loginScreen = '/loginview_screen';
  static const String registerScreen = '/register_screen';
  static const String homePage = '/home_screen';
  static const String itemDetails = '/itemDetails_screen';
  static const String notificationsScreen = '/notifications_screen';
  static const String profileScreen = '/profile_screen';
  static const String editProfileView = '/editProfile_screen';
  static const String aboutView = '/about_screen';
  static const String shareApp = '/share_screen';
  static const String supportView = '/support_screen';
  static const String forgetPasswordView = '/forgetPassword_screen';
  static const String otbCodeCerificationView = '/otbCodeCerification_screen';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splachScreen:
        initSplash();
        return MaterialPageRoute(builder: (_) => const SplachScreen());
      case Routes.outBoarding:
        return MaterialPageRoute(builder: (_) => const OutBoarding());
      case Routes.authScreen:
        initAuth();
        return MaterialPageRoute(builder: (context) => const Authentication());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (context) => const RegisterView());
      case Routes.homePage:
        initHome();
        return MaterialPageRoute(builder: (context) => const HomeView());
      case Routes.itemDetails:
        initProductDetails();
        return MaterialPageRoute(builder: (context) => const ItemDetails());
      case Routes.notificationsScreen:
        return MaterialPageRoute(
            builder: (context) => const NotificationsView());
      case Routes.profileScreen:
        return MaterialPageRoute(builder: (context) => const ProfileView());
      case Routes.editProfileView:
        return MaterialPageRoute(builder: (context) => const EditProfileView());
      case Routes.aboutView:
        return MaterialPageRoute(builder: (context) => const AboutView());
      case Routes.shareApp:
        return MaterialPageRoute(builder: (context) => const ShareApp());
      case Routes.supportView:
        return MaterialPageRoute(builder: (context) => const SupportView());
      case Routes.forgetPasswordView:
        initForgetPassword();
        return MaterialPageRoute(builder: (context) => ForgetPasswordView());
      case Routes.otbCodeCerificationView:
        return MaterialPageRoute(builder: (context) => VerificationScreen());
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
