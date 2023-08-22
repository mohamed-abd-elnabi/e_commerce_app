import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shop_avatar/core/constants.dart';
import 'package:shop_avatar/core/resources/manager_colors.dart';
import 'package:shop_avatar/core/resources/manager_height.dart';
import 'package:shop_avatar/core/resources/manager_text_styles.dart';
import 'package:shop_avatar/core/resources/manager_weight.dart';
import 'package:shop_avatar/features/auth/presentation/controller/auth_controller.dart';
import '../../../../core/resources/managar_font_size.dart';
import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_font_weight.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../routes/routes.dart';
import '../../../../core/widegts/base_button.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          elevation: ManagerConestant.elevationAppbar,
          backgroundColor: ManagerColors.transparent,
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: AlignmentDirectional.center,
            margin: EdgeInsets.symmetric(horizontal: ManagerHeight.h40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: ManagerHeight.h24,
                ),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    ManagerStrings.signUp.toUpperCase(),
                    style: getMediumTextStyle(
                      color: ManagerColors.primaryTextColor,
                      fontSize: ManagerFontSize.s30,
                    ),
                  ),
                ),
                SizedBox(
                  height: ManagerHeight.h18,
                ),
                TextField(
                  controller: controller.textUsernameEditingController,
                  decoration: InputDecoration(
                      fillColor: Colors.amber,
                      label: Text(
                        ManagerStrings.username,
                        style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s16,
                            color: ManagerColors.grey),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: ManagerColors.primaryColor)),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: ManagerColors.primaryTextColor))),
                ),
                SizedBox(
                  height: ManagerHeight.h18,
                ),
                TextField(
                  controller: controller.textEmailEditingController,
                  decoration: InputDecoration(
                      fillColor: Colors.amber,
                      label: Text(
                        ManagerStrings.email,
                        style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s16,
                            color: ManagerColors.grey),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: ManagerColors.primaryColor)),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: ManagerColors.primaryTextColor))),
                ),
                SizedBox(
                  height: ManagerHeight.h18,
                ),
                TextField(
                  controller: controller.textNumberEditingController,
                  decoration: InputDecoration(
                      fillColor: Colors.amber,
                      label: Text(
                        ManagerStrings.numberCity,
                        style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s16,
                            color: ManagerColors.grey),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: ManagerColors.primaryColor)),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: ManagerColors.primaryTextColor))),
                ),
                SizedBox(
                  height: ManagerHeight.h18,
                ),
                TextField(
                  controller: controller.textPasswordEditingController,
                  decoration: InputDecoration(
                      fillColor: Colors.amber,
                      label: Text(
                        ManagerStrings.password,
                        style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s16,
                            color: ManagerColors.grey),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: ManagerColors.primaryColor)),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: ManagerColors.primaryTextColor))),
                ),
                SizedBox(
                  height: ManagerHeight.h18,
                ),
                TextField(
                  controller: controller.textPasswordConfirmEditingController,
                  decoration: InputDecoration(
                      fillColor: Colors.amber,
                      label: Text(
                        ManagerStrings.confirmPassword,
                        style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s16,
                            color: ManagerColors.grey),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: ManagerColors.primaryColor)),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: ManagerColors.primaryTextColor))),
                ),
                SizedBox(
                  height: ManagerHeight.h24,
                ),
                Row(
                  children: [
                    Text(
                      ManagerStrings.alreadyhaveAcoount,
                      style: getRegularTextStyle(
                          fontSize: ManagerFontSize.s16,
                          color: ManagerColors.primaryTextColor),
                    ),
                    TextButton(
                      child: Text(
                        ManagerStrings.login,
                        style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s16,
                            color: ManagerColors.primaryColor),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.loginView);
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: ManagerHeight.h34,
                ),
                base_button(
                  title: ManagerStrings.signUp,
                  onPeessed: () {
                    //Navigator.pushNamed(context, Routes.HomePage);
                  },
                  isVisibalIcon: false,
                  spacer: ManagerConestant.Spacer3,
                  bgColor: ManagerColors.primaryColor,
                  textStyle: getRegularTextStyle(
                      color: ManagerColors.white,
                      fontSize: ManagerFontSize.s18),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
