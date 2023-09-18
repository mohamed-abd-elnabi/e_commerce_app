import 'package:flutter_state_render_dialog/flutter_state_render_dialog.dart';
import 'package:shop_avatar/core/resources/manager_weight.dart';
import 'package:shop_avatar/features/forget_password/presentation/controller/forget_password_controller.dart';
import 'package:shop_avatar/features/forget_password/presentation/view/widget/code_verification.dart';
import 'package:shop_avatar/routes/routes.dart';

import '../../../../core/resources/managar_font_size.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_height.dart';
import '../../../../core/resources/manager_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            title: Text(
              controller.code,
              style: getMediumTextStyle(
                fontSize: ManagerFontSize.s18,
                color: ManagerColors.blake,
              ),
            ),
            centerTitle: true,
            elevation: 0,
          ),
          backgroundColor: ManagerColors.white,
          body: Container(
            padding: EdgeInsets.symmetric(
              horizontal: ManagerWeight.w20,
              vertical: ManagerHeight.h20,
            ),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: ManagerHeight.h10,
                  ),
                  Text(
                    'subTitleVerification',
                    style: getMediumTextStyle(
                      fontSize: ManagerFontSize.s18,
                      color: ManagerColors.blake,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ManagerWeight.w24,
                      vertical: ManagerHeight.h4,
                    ),
                    child: Text(
                      'verifyMessage',
                      style: getRegularTextStyle(
                        fontSize: ManagerFontSize.s14,
                        color: ManagerColors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: ManagerHeight.h30,
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Container(
                      child: Row(
                        children: [
                          CodeVerification(
                            controller: controller.firstCodeTextController,
                            focusNode: controller.firstFocusNode,
                            previousFocusNode: controller.firstFocusNode,
                            onChanged: (String value) {
                              if (value.isNotEmpty) {
                                controller.secondFocusNode.requestFocus();
                              }
                            },
                            validator: (value) =>
                                controller.validator.validateCode(value),
                          ),
                          SizedBox(
                            width: ManagerWeight.w10,
                          ),
                          CodeVerification(
                            controller: controller.secondCodeTextController,
                            focusNode: controller.secondFocusNode,
                            previousFocusNode: controller.firstFocusNode,
                            onChanged: (String value) {
                              if (value.isNotEmpty) {
                                controller.thirdFocusNode.requestFocus();
                              } else {
                                controller.firstFocusNode.requestFocus();
                              }
                            },
                            validator: (value) =>
                                controller.validator.validateCode(value),
                          ),
                          SizedBox(
                            width: ManagerWeight.w10,
                          ),
                          CodeVerification(
                            controller: controller.thirdCodeTextController,
                            focusNode: controller.thirdFocusNode,
                            previousFocusNode: controller.secondFocusNode,
                            onChanged: (String value) {
                              if (value.isNotEmpty) {
                                controller.fourthFocusNode.requestFocus();
                              }
                            },
                            validator: (value) =>
                                controller.validator.validateCode(value),
                          ),
                          SizedBox(
                            width: ManagerWeight.w10,
                          ),
                          CodeVerification(
                            controller: controller.fourthCodeTextController,
                            focusNode: controller.fourthFocusNode,
                            previousFocusNode: controller.thirdFocusNode,
                            onChanged: (String value) {
                              if (value.isNotEmpty) {
                                controller.fifthFocusNode.requestFocus();
                              }
                            },
                            validator: (value) =>
                                controller.validator.validateCode(value),
                          ),
                          SizedBox(
                            width: ManagerWeight.w10,
                          ),
                          CodeVerification(
                            controller: controller.fifthCodeTextController,
                            focusNode: controller.fifthFocusNode,
                            previousFocusNode: controller.fourthFocusNode,
                            onChanged: (String value) {
                              if (value.isNotEmpty) {
                                controller.sixthFocusNode.requestFocus();
                              }
                            },
                            validator: (value) =>
                                controller.validator.validateCode(value),
                          ),
                          SizedBox(
                            width: ManagerWeight.w10,
                          ),
                          CodeVerification(
                            controller: controller.sixthCodeTextController,
                            focusNode: controller.sixthFocusNode,
                            previousFocusNode: controller.fifthFocusNode,
                            onChanged: (String value) {
                              if (value.isNotEmpty) {}
                            },
                            validator: (value) =>
                                controller.validator.validateCode(value),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ManagerHeight.h10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'resendCode',
                        style: getRegularTextStyle(
                          fontSize: ManagerFontSize.s14,
                          color: ManagerColors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (controller.validateCode()) {
                            Navigator.pushReplacementNamed(
                                context, Routes.homePage);
                          } else {
                            dialogRender(
                              context: context,
                              message: 'sorryFailed',
                              title: 'error',
                              stateRenderType: StateRenderType.popUpErrorState,
                              retryAction: () {
                                Get.back();
                              },
                            );
                          }
                        },
                        child: Text(
                          'send',
                          style: getMediumTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
