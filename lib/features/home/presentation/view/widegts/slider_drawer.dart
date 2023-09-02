import 'package:flutter/material.dart';
import 'package:shop_avatar/core/resources/managar_font_size.dart';
import 'package:shop_avatar/core/resources/manager_colors.dart';
import 'package:shop_avatar/core/resources/manager_height.dart';
import 'package:shop_avatar/core/storage/local/database/shared_preferences/app_setings_shared_preferences.dart';
import 'package:slide_drawer/slide_drawer.dart';
import '../../../../../core/resources/manager_text_styles.dart';

class SliderDrawer extends StatelessWidget {
  SliderDrawer({super.key});
  final AppSettingsSharedPreferences _appSettingsSharedPreferences =
      AppSettingsSharedPreferences();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              SlideDrawer.of(context)?.close();
            },
            icon: const Icon(Icons.login_sharp),
          )
        ],
      ),
      backgroundColor: ManagerColors.primaryColor,
      body: Center(
        child: Column(children: [
          const Spacer(),
          Text(
            _appSettingsSharedPreferences.getUserInfo().name,
            style: getMediumTextStyle(
                color: Colors.black, fontSize: ManagerFontSize.s24),
          ),
          SizedBox(
            height: ManagerHeight.h16,
          ),
          Text(
            _appSettingsSharedPreferences.getUserInfo().email,
            style: getMediumTextStyle(
                color: Colors.black, fontSize: ManagerFontSize.s16),
          ),
          const Spacer(
            flex: 2,
          ),
        ]),
      ),
    );
  }
}
