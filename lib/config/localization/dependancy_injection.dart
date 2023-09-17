import '../../core/storage/local/database/shared_preferences/app_setings_shared_preferences.dart';
import '../../features/auth/presentation/controller/auth_controller.dart';
import '../../features/product_details/domain/repository/product_details_repository.dart';
import '../../features/splach/presentation/controller/splach_controller.dart';
import '/core/internet_checker/internet_checker.dart';
import '/core/network/api/app_api.dart';
import '/core/network/api/dio_factory.dart';
import '/features/home/presentation/controller/home_controller.dart';
import '/features/product_details/data/data_source/remote_data_source.dart';
import '/features/product_details/domain/use_case/product_details_use_case.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

final instance = GetIt.instance;

initModule() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppSettingsSharedPreferences().initPreferences();

  if (!GetIt.I.isRegistered<NetworkInfo>()) {
    instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImplementation(
        InternetConnectionCheckerPlus(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<DioFactory>()) {
    instance.registerLazySingleton<DioFactory>(
      () => DioFactory(),
    );
  }

  if (!GetIt.I.isRegistered<AppApi>()) {
    Dio dio = await instance<DioFactory>().getDio();
    instance.registerLazySingleton<AppApi>(
      () => AppApi(dio),
    );
  }
}

initSplash() {
  Get.put<SplashController>(SplashController());
}

disposeSplash() {
  Get.delete<SplashController>();
}

initAuth() {
  disposeSplash();
  Get.put<AuthController>(AuthController());
}

disposeAuth() {
  Get.delete<AuthController>();
}

initHome() {
  disposeSplash();
  disposeAuth();
  initProductDetails();

  Get.put<HomeController>(HomeController());
}

disposeHome() {}

initProductDetails() {
  if (!GetIt.I.isRegistered<ProductDetailsRemoteDataSource>()) {
    instance.registerLazySingleton<ProductDetailsRemoteDataSource>(
      () => ProductDetailsDataSourceImplementation(
        instance<AppApi>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<ProductDetailsRepository>()) {
    instance.registerLazySingleton<ProductDetailsRepository>(
      () => ProductDetailsRepositoryImplementation(
        data: instance(),
        networkInfo: instance(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<ProductDetailsUseCaseImplementation>()) {
    instance.registerLazySingleton<ProductDetailsUseCaseImplementation>(
      () => ProductDetailsUseCaseImplementation(
        instance(),
      ),
    );
  }
}

disposeProductDetails() {}
