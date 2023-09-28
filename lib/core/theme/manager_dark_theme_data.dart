import 'package:flutter/material.dart';
import '../resources/managar_font_size.dart';
import '../resources/manager_colors.dart';
import '../resources/manager_text_styles.dart';

ThemeData managerDarkThemeData() {
  return ThemeData.dark().copyWith(
      useMaterial3: true,
      primaryColor: ManagerColors.primaryColor,
      primaryColorLight: ManagerColors.primaryTextColor,
      primaryColorDark: ManagerColors.white,
      disabledColor: ManagerColors.primaryTextColor,
      splashColor: ManagerColors.greyLight,
      backgroundColor: ManagerColors.homeScaffoldBackGround,
      scaffoldBackgroundColor: ManagerColors.blake,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ManagerColors.blake,
        elevation: 0,
        titleTextStyle: getBoldTextStyle(
          color: ManagerColors.white,
          fontSize: ManagerFontSize.s14,
        ),
      ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(),
        disabledColor: ManagerColors.greyLight,
        buttonColor: ManagerColors.primaryTextColorDark,
      ),
      elevatedButtonTheme:
          ElevatedButtonThemeData(style: ElevatedButton.styleFrom()),
      textTheme: TextTheme(
        bodySmall: getRegularTextStyle(
          color: ManagerColors.grey,
        ),
        bodyLarge: getBoldTextStyle(color: ManagerColors.blake),
        bodyMedium: getMediumTextStyle(
          color: ManagerColors.blake,
        ),
      ));
}
