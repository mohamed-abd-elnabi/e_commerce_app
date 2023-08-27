import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_avatar/routes/routes.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/widegts/helpers.dart';
import '../../data/data_source/auth_api_controller.dart';

class AuthController extends GetxController with Helpers {
  late TextEditingController textEmailEditingController;
  late TextEditingController textPasswordEditingController;
  late TextEditingController textUsernameEditingController;
  late TextEditingController textNumberEditingController;
  late TextEditingController textPasswordConfirmEditingController;

  AuthApiController authApiController = AuthApiController();

  @override
  void onInit() {
    // TODO: implement onInit
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

  performLogin(BuildContext context) async {
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
          error: false,
          message: 'Login Succesfulleu',
        );
        Get.back();
        Get.offAllNamed(Routes.homePage);
      }
      Get.back();
    }
  }

  bool checkData(BuildContext context) {
    if (textEmailEditingController.text.isEmpty) {
      showSnackBar(
        context: context,
        error: true,
        message: 'Email is required',
      );
      return false;
    }
    if (textPasswordEditingController.text.isEmpty) {
      showSnackBar(
        context: context,
        error: true,
        message: 'Password is required',
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
}
