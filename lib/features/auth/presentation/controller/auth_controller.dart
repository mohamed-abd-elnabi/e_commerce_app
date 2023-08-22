import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  late TextEditingController textEmailEditingController;
  late TextEditingController textPasswordEditingController;
  late TextEditingController textUsernameEditingController;
  late TextEditingController textNumberEditingController;
  late TextEditingController textPasswordConfirmEditingController;
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
}
