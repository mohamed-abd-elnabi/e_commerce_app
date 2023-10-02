import 'package:flutter/cupertino.dart';
import 'package:flutter_state_render_dialog/flutter_state_render_dialog.dart';
import 'package:get/get.dart';
import '../../../../config/localization/dependancy_injection.dart';
import '../../../../routes/routes.dart';
import '../../domain/models/forget_password_model.dart';
import '../../domain/use_case/forget_password_use_case.dart';

import 'package:flutter/material.dart';

class ForgetPasswordController extends GetxController {
  final ForgetPasswordUseCase _useCase = instance<ForgetPasswordUseCase>();
  late TextEditingController email;
  ForgetPasswordModel passwordModel = ForgetPasswordModel();
  late TextEditingController firstCodeTextController;
  late TextEditingController secondCodeTextController;
  late TextEditingController thirdCodeTextController;
  late TextEditingController fourthCodeTextController;
  late TextEditingController fifthCodeTextController;
  late TextEditingController sixthCodeTextController;
  var formKey = GlobalKey<FormState>();
  FieldValidator validator = FieldValidator();

  late FocusNode firstFocusNode;
  late FocusNode secondFocusNode;
  late FocusNode thirdFocusNode;
  late FocusNode fourthFocusNode;
  late FocusNode fifthFocusNode;
  late FocusNode sixthFocusNode;

  String code = '';
  @override
  void onInit() {
    super.onInit();
    email = TextEditingController();
    firstCodeTextController = TextEditingController();
    secondCodeTextController = TextEditingController();
    thirdCodeTextController = TextEditingController();
    fourthCodeTextController = TextEditingController();
    fifthCodeTextController = TextEditingController();
    sixthCodeTextController = TextEditingController();
    firstFocusNode = FocusNode();
    secondFocusNode = FocusNode();
    thirdFocusNode = FocusNode();
    fourthFocusNode = FocusNode();
    fifthFocusNode = FocusNode();
    sixthFocusNode = FocusNode();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
    firstCodeTextController.dispose();
    secondCodeTextController.dispose();
    thirdCodeTextController.dispose();
    fourthCodeTextController.dispose();
    fifthCodeTextController.dispose();
    sixthFocusNode.dispose();

    firstFocusNode.dispose();
    secondFocusNode.dispose();
    thirdFocusNode.dispose();
    fourthFocusNode.dispose();
    fifthFocusNode.dispose();
    sixthFocusNode.dispose();
    formKey.currentState!.dispose();
  }

  void forgetPassword(BuildContext context) async {
    dialogRender(
      context: context,
      message: 'loading',
      title: '',
      stateRenderType: StateRenderType.popUpLoadingState,
      retryAction: () {},
    );
    (await _useCase.execute(
      ForgetPasswordInput(
        email: email.text.toString(),
      ),
    ))
        .fold((l) {
      Get.back();
      dialogRender(
        context: context,
        message: l.message,
        title: 'sorryFailed',
        stateRenderType: StateRenderType.popUpErrorState,
        retryAction: () {
          Get.back();
        },
      );
    }, (r) {
      Get.back();
      if (r.result!) {
        code = r.code.toString();
        print('-------------ولك الوووووووووووووو');
        print(r.code);
        print('-------------ولك الوووووووووووووو');
        dialogRender(
            context: context,
            message: 'sendOtpSuccess',
            title: '',
            stateRenderType: StateRenderType.popUpSuccessState,
            retryAction: () {
              Get.back();

              Get.offNamed(Routes.otbCodeCerificationView, arguments: r.code);
            });
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
    });
  }

  bool validateCode() {
    String enteredCode = "${firstCodeTextController.text}"
        "${secondCodeTextController.text}"
        "${thirdCodeTextController.text}"
        "${fourthCodeTextController.text}"
        "${fifthCodeTextController.text}"
        "${sixthCodeTextController.text}";

    if (enteredCode == code) {
      return true;
    } else {
      return false;
    }
  }
}

class FieldValidator {
  String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'invalidEmptyEmail';
    }
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(email)) {
      return 'invalidEmail';
    }
    return null;
  }

  String? validatePassword(String password) {
    if (!RegExp(r'.{8,}').hasMatch(password)) {
      return 'invalidPasswordLength';
    }
    return null;
  }

  String? confirmPassword(String password, String confirmedPassword) {
    if (password != confirmedPassword) {
      return 'passwordNotMatch';
    }
    return null;
  }

  String? validatePhoneNumber(String phoneNumber) {
    if (phoneNumber.isEmpty) {
      return 'invalidEmptyPhoneNumber';
    }
    if (phoneNumber.length > 9 && phoneNumber.length < 11) {
      return null;
    }
    return 'invalidPhoneNumber';
  }

  String? validateFullName(String fullName) {
    if (fullName.isEmpty) {
      return 'invalidEmptyFullName';
    }
    if (fullName.length < 3) {
      return 'invalidFullName';
    }
    return null;
  }

  String? validateCode(value) {
    if (value == null || value.trim().isEmpty) {
      return 'invalidEmptyCode';
    }
    return null;
  }
}
