import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/core/constants.dart';
import '/core/resources/manager_colors.dart';
import '/core/resources/manager_height.dart';
import '/core/resources/manager_spacer.dart';
import '/core/resources/manager_text_styles.dart';
import '/core/resources/manager_weight.dart';
import '/features/auth/presentation/controller/auth_controller.dart';
import '../../../../core/resources/managar_font_size.dart';
import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../routes/routes.dart';
import '../../../../core/widegts/base_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        // init: AuthController(),
        builder: (controller) {
      return Scaffold(
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          elevation: ManagerConestant.elevationAppbar,
          backgroundColor: ManagerColors.transparent,
        ),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Container(
            alignment: AlignmentDirectional.center,
            margin: EdgeInsets.symmetric(horizontal: ManagerHeight.h24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  ManagerAssets.logoapplogin,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(
                  height: ManagerHeight.h18,
                ),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    ManagerStrings.signIn.toUpperCase(),
                    style: getMediumTextStyle(
                      color: ManagerColors.primaryTextColor,
                      fontSize: ManagerFontSize.s30,
                    ),
                  ),
                ),
                SizedBox(
                  height: ManagerHeight.h16,
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
                              color: ManagerColors.primaryTextColor)),
                      errorText: controller.emailError,
                      errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: ManagerColors.error))),
                ),
                SizedBox(
                  height: ManagerHeight.h16,
                ),
                TextField(
                  controller: controller.textPasswordEditingController,
                  obscureText: controller.showPassword,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          controller.changePasswordVisibility();
                        },
                        icon: controller.showPassword
                            ? const Icon(
                                Icons.visibility_off,
                              )
                            : const Icon(
                                Icons.visibility,
                                color: ManagerColors.primaryColor,
                              )),
                    label: Text(
                      ManagerStrings.password,
                      style: getRegularTextStyle(
                          fontSize: ManagerFontSize.s16,
                          color: ManagerColors.grey),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: ManagerColors.primaryColor),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: ManagerColors.primaryTextColor,
                      ),
                    ),
                    errorText: controller.passwordError,
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ManagerColors.error),
                    ),
                  ),
                ),
                SizedBox(
                  height: ManagerHeight.h24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: ManagerWeight.w10,
                      height: ManagerHeight.h10,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: ManagerColors.primaryColor)),
                    ),
                    Text(
                      ManagerStrings.rememberMe,
                      style: getRegularTextStyle(
                          fontSize: ManagerFontSize.s12,
                          color: ManagerColors.primaryTextColor),
                    ),
                    SizedBox(
                      width: ManagerHeight.h10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.forgetPasswordView);
                      },
                      child: Text(
                        ManagerStrings.forgetPassword,
                        style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s10,
                            color: ManagerColors.primaryColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ManagerHeight.h34,
                ),
                Row(
                  children: [
                    Text(
                      ManagerStrings.haveAcoount,
                      style: getRegularTextStyle(
                          fontSize: ManagerFontSize.s14,
                          color: ManagerColors.primaryTextColor),
                    ),
                    TextButton(
                      child: Text(
                        ManagerStrings.signUp,
                        style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.primaryColor),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.registerScreen);
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: ManagerHeight.h24,
                ),
                base_button(
                  title: ManagerStrings.login,
                  onPreessed: () {
                    controller.performLogin(context);
                  },
                  isVisibalIcon: false,
                  spacer: ManagerSpacer.s3,
                  bgColor: ManagerColors.primaryColor,
                  textStyle: getRegularTextStyle(
                      color: ManagerColors.white,
                      fontSize: ManagerFontSize.s18),
                ),
                SizedBox(
                  height: ManagerHeight.h24,
                ),
                Text(
                  ManagerStrings.or,
                  style: getRegularTextStyle(
                      fontSize: ManagerFontSize.s16,
                      color: ManagerColors.primaryTextColor),
                ),
                SizedBox(
                  height: ManagerHeight.h24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(ManagerAssets.facebookIconSignIn),
                    Image.asset(ManagerAssets.googelIconSignIn),
                    Image.asset(ManagerAssets.twitterIconSignIn),
                  ],
                ),
                SizedBox(
                  height: ManagerHeight.h50,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
