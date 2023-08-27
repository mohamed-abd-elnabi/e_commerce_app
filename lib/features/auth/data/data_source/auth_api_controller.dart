import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shop_avatar/core/constants.dart';
import 'package:shop_avatar/core/storage/local/database/shared_preferences/app_setings_shared_preferences.dart';
import 'package:shop_avatar/core/widegts/helpers.dart';

class AuthApiController with Helpers {
  AppSettingsSharedPreferences appSettingsSharedPreferences =
      AppSettingsSharedPreferences();
  Future<bool> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    Uri url = Uri.parse(ApiRequest.login);
    Response response = await http.post(
      url,
      body: {
        ApiConstants.email: email,
        ApiConstants.password: password,
      },
      headers: {
        ApiConstants.acceptLanguage: appSettingsSharedPreferences.defaultLocale,
      },
    );
    var json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      appSettingsSharedPreferences
          .setToken(json[ApiConstants.accessToken] ?? '');
      appSettingsSharedPreferences.setLoggedIn();
      return true;
    }

    showSnackBar(
      context: context,
      error: true,
      message: json[ApiConstants.errormassage] ?? 'error',
    );
    return false;
  }
}
