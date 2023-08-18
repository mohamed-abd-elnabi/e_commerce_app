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
          margin: const EdgeInsets.symmetric(horizontal: ManagerHeight.h16),
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
                style: const TextStyle(
                  color: ManagerColors.white,
                  fontSize: ManagerFontSize.s28,
                  fontWeight: ManagerFontWeight.w300,
                ),
              ),
              const SizedBox(
                height: ManagerHeight.h8,
              ),
              Text(
                ManagerStrings.new4shop.toUpperCase(),
                style: const TextStyle(
                    color: ManagerColors.white,
                    fontSize: ManagerFontSize.s38,
                    fontWeight: ManagerFontWeight.bold,
                    letterSpacing: ManagerConestant.letterSp5),
              ),
              const Spacer(),
              base_button(
                title: ManagerStrings.signUp,
                onPeessed: () {
                  Navigator.pushNamed(context, Routes.registerView);
                },
                isVisibalIcon: false,
                spacer: ManagerConestant.Spacer3,
                textStyle: const TextStyle(
                    color: ManagerColors.white, fontSize: ManagerFontSize.s18),
              ),
              const SizedBox(
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
                textStyle: const TextStyle(
                    color: ManagerColors.primaryColor,
                    fontSize: ManagerFontSize.s18),
              ),
              const SizedBox(
                height: ManagerHeight.h18,
              ),
              base_button(
                title: ManagerStrings.visitor,
                onPeessed: () {},
                spacer: ManagerConestant.Spacer3,
                bgColor: ManagerColors.white
                    .withOpacity(ManagerConestant.OpacityButtonauthscreen),
                textStyle: const TextStyle(
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
