import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shop_avatar/core/resources/manager_assets.dart';
import 'package:shop_avatar/core/resources/manager_strings.dart';
import 'package:shop_avatar/core/resources/manager_text_styles.dart';
import 'package:shop_avatar/features/forget_password/presentation/controller/forget_password_controller.dart';
import '../../../../core/constants.dart';
import '../../../../core/resources/managar_font_size.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_height.dart';
import '../../../../core/resources/manager_spacer.dart';
import '../../../../core/widegts/base_button.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          elevation: ManagerConestant.elevationAppbar,
          backgroundColor: ManagerColors.transparent,
          title: Text(ManagerStrings.forgetPassword.toUpperCase(),
              style: getRegularTextStyle(
                  color: ManagerColors.white, fontSize: ManagerFontSize.s18)),
          centerTitle: true,
        ),
        body: Container(
          margin:
              EdgeInsetsDirectional.symmetric(horizontal: ManagerHeight.h40),
          child: Column(
            children: [
              SizedBox(
                height: ManagerHeight.h80,
              ),
              Image.asset(ManagerAssets.mmm),
              SizedBox(
                height: ManagerHeight.h40,
              ),
              TextField(
                controller: controller.email,
                decoration: InputDecoration(
                    label: Text(
                      ManagerStrings.writeYourEmail,
                      style: getRegularTextStyle(
                          fontSize: ManagerFontSize.s16,
                          color: ManagerColors.grey),
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ManagerColors.greyLight)),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: ManagerColors.primaryColor)),
                    errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ManagerColors.error))),
              ),
              SizedBox(
                height: ManagerHeight.h40,
              ),
              base_button(
                title: ManagerStrings.send,
                onPreessed: () {
                  controller.forgetPassword(context);
                },
                isVisibalIcon: false,
                spacer: ManagerSpacer.s3,
                bgColor: ManagerColors.primaryColor,
                textStyle: getRegularTextStyle(
                    color: ManagerColors.white, fontSize: ManagerFontSize.s18),
              ),
            ],
          ),
        ),
      );
    });
  }
}
