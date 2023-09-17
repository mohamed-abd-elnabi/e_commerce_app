import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_avatar/config/locale/locale_settings.dart';
import 'package:shop_avatar/config/localization/dependancy_injection.dart';
import 'package:shop_avatar/core/resources/manager_assets.dart';
import 'package:shop_avatar/routes/routes.dart';
import 'core/constants.dart';
import 'firebase_options.dart';

main() async {
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  await initModule();
  runApp(
    EasyLocalization(
      supportedLocales: localeSettings.locales,
      path: ManagerPathes.translationsPaths,
      startLocale: localeSettings.defaultLocale,
      fallbackLocale: localeSettings.defaultLocale,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      designSize: const Size(
        ManagerConestant.designDeviceWidth,
        ManagerConestant.designDeviceHeight,
      ),
      builder: (context, child) {
        return GetMaterialApp(
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          debugShowCheckedModeBanner: false,

          theme: ThemeData(
            useMaterial3: true,
          ),
          initialRoute: Routes.splachScreen,
          onGenerateRoute: RouteGenerator.getRoute,
          // defaultTransition: Transition.cupertino,

          //   routes: {
          //     Routes.splashScreen: (context) => const SplachScreen(),
          //     Routes.outBoarding: (context) => const OutBoarding(),
          //     Routes.authScreen: (context) => const Authentication(),
          //     Routes.loginView: (context) => const LoginView(),
          //     Routes.registerView: (context) => const RegisterView(),
          //   },
        );
      },
    );
  }
}
