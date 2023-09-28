import 'package:flutter/material.dart';
import '../resources/managar_font_size.dart';
import '../resources/manager_colors.dart';
import '../resources/manager_text_styles.dart';
import '../resources/manager_text_theme_light.dart';

ThemeData managerLightThemeData() {
  return ThemeData.light().copyWith(
    useMaterial3: true,

    /// main color of the app
    primaryColor: ManagerColors.primaryColor,
    primaryColorLight: ManagerColors.white,
    primaryColorDark: ManagerColors.primaryTextColorDark,
    disabledColor: ManagerColors.primaryTextColor,
    // this for disabled button color
    splashColor: ManagerColors.greyLight,
    backgroundColor: ManagerColors.homeScaffoldBackGround,
    scaffoldBackgroundColor: ManagerColors.homeScaffoldBackGround,

    /// AppBar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ManagerColors.white,
      elevation: 0,
      titleTextStyle: getBoldTextStyle(
        color: ManagerColors.blake,
        fontSize: ManagerFontSize.s14,
      ),
    ),

    /// Button theme
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(),
      disabledColor: ManagerColors.blake,
      buttonColor: ManagerColors.primaryColor,
    ),

    /// Text Theme
    textTheme: ManagerTextThemeLight(),
  );
}
