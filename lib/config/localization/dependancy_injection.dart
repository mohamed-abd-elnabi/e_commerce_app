import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:shop_avatar/features/forget_password/data/repoitory_impl/forget_password_repository_impl.dart';

import '../../core/storage/local/database/shared_preferences/app_setings_shared_preferences.dart';
import '../../features/auth/presentation/controller/auth_controller.dart';
import '../../features/forget_password/data/data_sourse/forget_password_remote_data_source.dart';
import '../../features/forget_password/domain/repository/forget_passwor_repository.dart';
import '../../features/forget_password/domain/use_case/forget_password_use_case.dart';
import '../../features/forget_password/presentation/controller/forget_password_controller.dart';
import '../../features/out_boarding/presentation/controller/outboading_controller.dart';
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
  await EasyLocalization.ensureInitialized();
  await AppSettingsSharedPreferences().initPreferences();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

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
  initOutBoarding();
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

initOutBoarding() {
  Get.put<OutBoardingController>(OutBoardingController());
}

disposeOutBoarding() {
  Get.delete<OutBoardingController>();
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
      () => ProductDetailsRemoteDataSourceImplementation(
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

initForgetPassword() {
  if (!GetIt.I.isRegistered<RemoteForgetPasswordDataSource>()) {
    instance.registerLazySingleton<RemoteForgetPasswordDataSource>(
        () => RemoteForgetPasswordDataSourceImplement(instance<AppApi>()));
  }
  if (!GetIt.I.isRegistered<ForgetPasswordRepository>()) {
    instance.registerLazySingleton<ForgetPasswordRepository>(
        () => ForgetPasswordRepositoryImpl(instance(), instance()));
  }
  if (!GetIt.I.isRegistered<ForgetPasswordUseCase>()) {
    instance.registerFactory<ForgetPasswordUseCase>(
      () => ForgetPasswordUseCase(
        instance<ForgetPasswordRepository>(),
      ),
    );
  }
  Get.put(ForgetPasswordController());
}

disposeForgetPassword() async {
  if (GetIt.I.isRegistered<RemoteForgetPasswordDataSource>()) {
    instance.unregister<RemoteForgetPasswordDataSource>();
  }

  if (GetIt.I.isRegistered<ForgetPasswordRepository>()) {
    instance.unregister<ForgetPasswordRepository>();
  }

  if (GetIt.I.isRegistered<ForgetPasswordUseCase>()) {
    instance.unregister<ForgetPasswordUseCase>();
  }
}
