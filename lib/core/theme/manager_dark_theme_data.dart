import 'package:flutter/material.dart';
import '../resources/managar_font_size.dart';
import '../resources/manager_colors.dart';
import '../resources/manager_text_styles.dart';
import '../resources/manager_text_theme_dark.dart';

ThemeData managerThemeDarkData() {
  return ThemeData.dark().copyWith(
    useMaterial3: true,
    primaryColor: ManagerColors.primaryColor,
    primaryColorLight: ManagerColors.blake,
    primaryColorDark: ManagerColors.blake,
    scaffoldBackgroundColor: ManagerColors.blake,
    textTheme: ManagerTextThemeDark(),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ManagerColors.greyLight,
      elevation: 0,
      titleTextStyle: getBoldTextStyle(
        color: ManagerColors.primaryColor,
        fontSize: ManagerFontSize.s14,
      ),
    ),
  );
}
