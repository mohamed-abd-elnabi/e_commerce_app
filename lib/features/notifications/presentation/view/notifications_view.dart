import 'package:flutter/material.dart';
import 'package:shop_avatar/core/resources/manager_assets.dart';
import 'package:shop_avatar/core/resources/manager_colors.dart';
import 'package:shop_avatar/core/resources/manager_strings.dart';
import '../../../../core/constants.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: ManagerConestant.elevationAppbar,
          backgroundColor: ManagerColors.transparent,
          title: Text(
            ManagerStrings.notifications.toUpperCase(),
          )),
      body: Center(child: Image.asset(ManagerAssets.disableAlarm)),
    );
  }
}
