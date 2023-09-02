import 'package:get/get.dart';
import '../../../../core/constants.dart';
import '../../../../core/storage/local/database/shared_preferences/app_setings_shared_preferences.dart';
import '../../../../routes/routes.dart';

class SplashController extends GetxController {
  AppSettingsSharedPreferences appSettingsSharedPreferences =
      AppSettingsSharedPreferences();

  //BuildContext? context;
  @override
  void onInit() {
    super.onInit();
    //appSettingsSharedPreferences.clear();
    Future.delayed(const Duration(seconds: ManagerConestant.SplachTime), () {
      print('الوووووووووووووووووووووووووووووو');
      print(appSettingsSharedPreferences.loggedIn);
      String route = appSettingsSharedPreferences.loggedIn
          ? Routes.homePage
          : appSettingsSharedPreferences.outBoardingViewed
              ? Routes.authScreen
              : Routes.outBoarding;
      Get.offAllNamed(route);
    });
  }
}
