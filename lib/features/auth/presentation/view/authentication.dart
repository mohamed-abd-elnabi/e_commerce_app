import 'package:flutter/material.dart';
import 'package:shop_avatar/core/constants.dart';
import 'package:shop_avatar/core/resources/manager_assets.dart';
import 'package:shop_avatar/core/resources/manager_colors.dart';
import 'package:shop_avatar/core/resources/manager_height.dart';
import 'package:shop_avatar/core/resources/manager_strings.dart';
import 'package:shop_avatar/routes/routes.dart';
import 'package:shop_avatar/core/widegts/base_button.dart';
import '../../../../core/resources/managar_font_size.dart';
import '../../../../core/resources/manager_font_weight.dart';
import '../../../../core/resources/manager_text_styles.dart';

class Authentication extends StatelessWidget {
  const Authentication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            ManagerAssets.authBg,
            fit: BoxFit.fitWidth,
          ),
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black.withOpacity(ManagerConestant.OpacityBgauthscreen),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: ManagerHeight.h16),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: ManagerConestant.Spacer3,
              ),
              Image.asset(ManagerAssets.logoAppAuth),
              const Spacer(
                flex: 2,
              ),
              Text(
                ManagerStrings.welcome.toUpperCase(),
                style: getMediumTextStyle(
                  color: ManagerColors.white,
                  fontSize: ManagerFontSize.s28,
                ),
              ),
              SizedBox(
                height: ManagerHeight.h8,
              ),
              Text(
                ManagerStrings.new4shop.toUpperCase(),
                style: getBoldTextStyle(
                  color: ManagerColors.white,
                  fontSize: ManagerFontSize.s38,
                ),
              ),
              const Spacer(),
              base_button(
                title: ManagerStrings.signUp,
                onPeessed: () {
                  Navigator.pushNamed(context, Routes.registerView);
                },
                isVisibalIcon: false,
                spacer: ManagerConestant.Spacer3,
                textStyle: getRegularTextStyle(
                    color: ManagerColors.white, fontSize: ManagerFontSize.s18),
              ),
              SizedBox(
                height: ManagerHeight.h18,
              ),
              base_button(
                title: ManagerStrings.signIn,
                onPeessed: () {
                  Navigator.pushNamed(context, Routes.loginView);
                },
                isVisibalIcon: false,
                spacer: ManagerConestant.Spacer3,
                bgColor: ManagerColors.white,
                textStyle: getRegularTextStyle(
                    color: ManagerColors.primaryColor,
                    fontSize: ManagerFontSize.s18),
              ),
              SizedBox(
                height: ManagerHeight.h18,
              ),
              base_button(
                title: ManagerStrings.visitor,
                onPeessed: () {},
                spacer: ManagerConestant.Spacer3,
                bgColor: ManagerColors.white
                    .withOpacity(ManagerConestant.OpacityButtonauthscreen),
                textStyle: getRegularTextStyle(
                    color: ManagerColors.white, fontSize: ManagerFontSize.s18),
              ),
              const Spacer(),
            ],
          ),
        ),
      ]),
    );
  }
}
