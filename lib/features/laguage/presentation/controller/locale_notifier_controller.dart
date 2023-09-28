import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../../config/locale/locale_settings.dart';
import '../../../../core/storage/local/database/shared_preferences/app_setings_shared_preferences.dart';

class LocaleNotifierController extends GetxController {
  final AppSettingsSharedPreferences _appSettingsPrefs =
      AppSettingsSharedPreferences();
  final languagesList = LocaleSettings.languages;

  String get currentLanguage => _appSettingsPrefs.defaultLocale;

  Future<void> changeLanguage(
      {required BuildContext context, required String languageCode}) async {
    _appSettingsPrefs.setDefaultLocale(languageCode);
    EasyLocalization.of(context)!.setLocale(
      Locale(
        languageCode,
      ),
    );
    Get.updateLocale(Locale(languageCode));
    update();
  }
}
