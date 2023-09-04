import 'package:flutter/material.dart';
import 'package:shop_avatar/core/constants.dart';

mixin Helpers {
  void showSnackBar({
    required BuildContext context,
    required String message,
    bool error = false,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: error ? Colors.red : Colors.green,
        duration: const Duration(seconds: ManagerConestant.timeSnackBar),
      ),
    );
  }
}
