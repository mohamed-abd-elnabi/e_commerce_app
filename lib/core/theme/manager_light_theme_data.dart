import 'package:flutter/material.dart';
import 'package:shop_avatar/core/resources/manager_colors.dart';

ThemeData managerThemeLightData() {
  return ThemeData.light().copyWith(
    useMaterial3: true,
    primaryColor: ManagerColors.primaryColor,
    primaryColorLight: ManagerColors.white,
    primaryColorDark: ManagerColors.blake,
    disabledColor: ManagerColors.primaryTextColor,
  );
}
