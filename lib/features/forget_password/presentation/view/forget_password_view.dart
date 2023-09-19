import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shop_avatar/core/resources/manager_text_styles_light.dart';
import 'package:shop_avatar/features/forget_password/presentation/controller/forget_password_controller.dart';
import '../../../../core/resources/managar_font_size.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_height.dart';
import '../../../../core/resources/manager_spacer.dart';
import '../../../../core/widegts/base_button.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Forgot password'.toUpperCase(),
              style: getRegularTextStyle(fontSize: 18)),
          centerTitle: true,
          backgroundColor: const Color(0xffF8F8FC),
        ),
        body: Container(
          margin: EdgeInsetsDirectional.symmetric(horizontal: 40),
          child: Column(
            children: [
              SizedBox(
                height: ManagerHeight.h80,
              ),
              Image.asset('assets/images/splach/mmm.png'),
              SizedBox(
                height: ManagerHeight.h40,
              ),
              TextField(
                controller: controller.email,
                decoration: InputDecoration(
                    fillColor: Colors.amber,
                    label: Text(
                      'Write Your Email',
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
                title: 'Send',
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
