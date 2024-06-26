import 'package:flutter/material.dart';
import 'package:shop_avatar/core/constants.dart';
import 'package:shop_avatar/core/storage/local/database/shared_preferences/app_setings_shared_preferences.dart';

LocaleSettings localeSettings = LocaleSettings();

class LocaleSettings {
  final AppSettingsSharedPreferences _appSettingsSharedPreferences =
      AppSettingsSharedPreferences();

  static Map<String, String> languages = {
    keyConestant.arabic: keyConestant.arabicName,
    keyConestant.english: keyConestant.englishName,
  };

  List<Locale> get locales =>
      languages.keys.map((langKey) => Locale(langKey)).toList();

  Locale get defaultLocale =>
      Locale(_appSettingsSharedPreferences.defaultLocale);
}
