import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_avatar/core/extinsion/extinsion.dart';
import 'package:shop_avatar/core/resources/manager_strings.dart';
import 'package:shop_avatar/routes/routes.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/widegts/helpers.dart';
import '../../data/data_source/auth_api_controller.dart';

class AuthController extends GetxController with Helpers {
  late TextEditingController textEmailEditingController;
  late TextEditingController textPasswordEditingController;
  late TextEditingController textUsernameEditingController;
  late TextEditingController textNumberEditingController;
  late TextEditingController textPasswordConfirmEditingController;
  String? emailError;
  String? passwordError;
  String? confirmPasswordError;
  String? nameError;
  String? phoneError;
  AuthApiController authApiController = AuthApiController();
  bool showPassword = true;
  bool showConfirmPassword = true;
  changePasswordVisibility() {
    showPassword = !showPassword;
    update();
  }

  changeConfirmPasswordVisibility() {
    showConfirmPassword = !showConfirmPassword;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    textEmailEditingController = TextEditingController();
    textPasswordEditingController = TextEditingController();
    textUsernameEditingController = TextEditingController();
    textNumberEditingController = TextEditingController();
    textPasswordConfirmEditingController = TextEditingController();
  }

  @override
  void dispose() {
    textEmailEditingController.dispose();
    textPasswordEditingController.dispose();
    textUsernameEditingController.dispose();
    textNumberEditingController.dispose();
    textPasswordConfirmEditingController.dispose();
    super.dispose();
  }

  resetErrors() {
    emailError = null;
    passwordError = null;
    confirmPasswordError = null;
    nameError = null;
    phoneError = null;
  }

  performLogin(BuildContext context) async {
    resetErrors();
    if (checkData(context)) {
      showDialog(
        context: context,
        builder: (context) {
          return const Center(
              child: CircularProgressIndicator(
            color: ManagerColors.primaryColor,
            backgroundColor: ManagerColors.white,
          ));
        },
      );
      if (await authApiController.login(
        email: textEmailEditingController.text.toString(),
        password: textPasswordEditingController.text.toString(),
        context: context,
      )) {
        showSnackBar(
          context: context,
          message: ManagerStrings.loginSuccesfulleu,
        );
        Get.back();
        Get.offAllNamed(Routes.homePage);
      }
      Get.back();
    }
    update();
  }

  bool checkEmail(BuildContext context) {
    if (textEmailEditingController.text.isEmpty) {
      emailError = ManagerStrings.emailRequired;
      showSnackBar(
        context: context,
        error: true,
        message: emailError.onNull(),
      );
      return false;
    }
    return true;
  }

  bool checkPassword(BuildContext context) {
    if (textPasswordEditingController.text.isEmpty) {
      passwordError = ManagerStrings.passwordRequired;
      showSnackBar(
        context: context,
        error: true,
        message: passwordError.onNull(),
      );

      return false;
    }
    if (textPasswordEditingController.text.length < 6) {
      showSnackBar(
        context: context,
        error: true,
        message: 'Password must be at least 6 characters',
      );
    } else {}

    return true;
  }

  bool confirmPassword(BuildContext context) {
    if (textPasswordEditingController.text !=
        textPasswordConfirmEditingController.text) {
      confirmPasswordError = 'Passwords do not match';
      passwordError = confirmPasswordError;
      showSnackBar(
        context: context,
        error: true,
        message: confirmPasswordError.onNull(),
      );

      return false;
    }

    return true;
  }

  bool checkNumber(BuildContext context) {
    if (textNumberEditingController.text.isEmpty) {
      phoneError = 'phone is required';
      showSnackBar(
        context: context,
        error: true,
        message: phoneError.onNull(),
      );

      return false;
    }

    return true;
  }

  bool checkName(BuildContext context) {
    if (textUsernameEditingController.text.isEmpty) {
      nameError = 'name is required';
      showSnackBar(
        context: context,
        error: true,
        message: nameError.onNull(),
      );

      return false;
    }

    return true;
  }

  bool checkNames(BuildContext context) {
    return true;
  }

  bool checkData(BuildContext context) {
    if (!checkEmail(context)) {
      return false;
    }
    if (!checkPassword(context)) {
      return false;
    }
    return true;
  }

  performRegister(BuildContext context) async {
    resetErrors();
    if (checkRegisterData(context)) {
      showDialog(
        context: context,
        builder: (context) {
          return const Center(
              child: CircularProgressIndicator(
            color: ManagerColors.primaryColor,
            backgroundColor: ManagerColors.white,
          ));
        },
      );

      if (await authApiController.register(
        email: textEmailEditingController.text.toString(),
        password: textPasswordEditingController.text.toString(),
        name: textUsernameEditingController.text.toString(),
        context: context,
        passwordConfirmation:
            textPasswordConfirmEditingController.text.toString(),
        phone: textNumberEditingController.text.toString(),
      )) {
        showSnackBar(
          context: context,
          error: false,
          message: 'Register Succesfulleu',
        );
        Get.back();
        Get.offAllNamed(Routes.loginView);
      }
      Get.back();
    }
    update();
  }

  bool checkRegisterData(BuildContext context) {
    if (!checkName(context)) {
      return false;
    }
    if (!checkEmail(context)) {
      return false;
    }
    if (!checkNumber(context)) {
      return false;
    }
    if (!checkPassword(context)) {
      return false;
    }
    if (!confirmPassword(context)) {
      return false;
    }
    return true;
  }
}
