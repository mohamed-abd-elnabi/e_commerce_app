import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shop_avatar/core/internet_checker/internet_checker.dart';
import 'package:shop_avatar/core/network/api/app_api.dart';
import 'package:shop_avatar/core/network/api/dio_factory.dart';
import 'package:shop_avatar/core/storage/local/database/shared_preferences/app_setings_shared_preferences.dart';
import 'package:shop_avatar/features/home/presentation/controller/home_controller.dart';
import '../../features/auth/presentation/controller/auth_controller.dart';
import '../../features/product_details/presentation/controller/product_details_controller.dart';
import '../../features/splach/presentation/controller/splach_controller.dart';

final instance = GetIt.instance;

initModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSettingsSharedPreferences().initPreferences();

  if (!GetIt.I.isRegistered<NetworkInfo>()) {
    instance.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImplementation(InternetConnectionCheckerPlus()));
  }

  if (!GetIt.I.isRegistered<DioFactory>()) {
    instance.registerLazySingleton<DioFactory>(() => DioFactory());
  }

  if (!GetIt.I.isRegistered<AppApi>()) {
    Dio dio = await instance<DioFactory>().getDio();
    instance.registerLazySingleton<AppApi>(() => AppApi(dio));
  }
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
  Get.put<ProductDetailsController>(ProductDetailsController());
}

disposeDetails() {
  Get.delete<ProductDetailsController>();
}
