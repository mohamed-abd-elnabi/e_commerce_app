import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shop_avatar/core/storage/local/database/shared_preferences/app_setings_shared_preferences.dart';
import 'package:shop_avatar/features/home/presentation/controller/home_controller..dart';
import '../../features/auth/presentation/controller/auth_controller.dart';
import '../../features/product_details/controller/item_details.dart';
import '../../features/splach/presentation/controller/splach_controller.dart';

initModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSettingsSharedPreferences().initPreferences();
}

initAuth() {
  disposeSplash();
  Get.put<AuthController>(AuthController());
}

disposeAuth() {
  Get.delete<AuthController>();
}

initSplash() {
  Get.put<SplashController>(SplashController());
}

disposeSplash() {
  Get.delete<SplashController>();
}

initHome() {
  disposeSplash();
  disposeAuth();
  initDetails();
  Get.put<HomeController>(HomeController());
}

disposeHome() {}

initDetails() {
  Get.put<DetailsController>(DetailsController());
}

disposeDetails() {
  Get.delete<DetailsController>();
}
