import 'package:flutter/material.dart';
import 'package:shop_avatar/core/resources/managar_font_size.dart';
import 'package:shop_avatar/core/resources/manager_assets.dart';
import 'package:shop_avatar/core/resources/manager_colors.dart';
import 'package:shop_avatar/core/resources/manager_strings.dart';
import 'package:shop_avatar/core/resources/manager_text_styles.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ManagerStrings.notifications.toUpperCase(),
            style: getRegularTextStyle(fontSize: ManagerFontSize.s18)),
        centerTitle: true,
        backgroundColor: ManagerColors.homeScaffoldBackGround,
      ),
      body: Center(child: Image.asset(ManagerAssets.disableAlarm)),
    );
  }
}
