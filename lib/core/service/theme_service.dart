//بتعمل تبديل بين الدارك مود واللايت مود
import 'package:flutter/material.dart';
import 'package:shop_avatar/config/localization/dependancy_injection.dart';
import 'package:shop_avatar/core/constants.dart';
import 'package:shop_avatar/core/storage/local/database/shared_preferences/app_setings_shared_preferences.dart';
import 'package:shop_avatar/core/theme/manager_dark_theme_data.dart';
import 'package:shop_avatar/core/theme/manager_light_theme_data.dart';

class ThemeService {
  late final AppSettingsSharedPreferences _sharedPreferences;

  ThemeService()
      : _sharedPreferences = instance<AppSettingsSharedPreferences>();

  bool isDarkTheme() =>
      _sharedPreferences.getAppTheme() == ManagerConestant.dark;

  ThemeMode getThemeMode() => isDarkTheme() ? ThemeMode.dark : ThemeMode.light;

  ThemeData getThemeData() =>
      isDarkTheme() ? managerDarkThemeData() : managerLightThemeData();
}
