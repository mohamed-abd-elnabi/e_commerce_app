import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shop_avatar/core/constants.dart';
import 'package:shop_avatar/core/storage/local/database/shared_preferences/app_setings_shared_preferences.dart';
import 'package:shop_avatar/core/widegts/helpers.dart';
import 'package:shop_avatar/features/auth/data/mapper/login_mapper.dart';
import 'package:shop_avatar/features/auth/data/response/login_response.dart';
import 'package:shop_avatar/features/auth/presentation/model/login_model.dart';

class AuthApiController with Helpers {
  AppSettingsSharedPreferences appSettingsSharedPreferences =
      AppSettingsSharedPreferences();

  Future post({
    required String endPoint,
    required Map<String, dynamic> body,
    required Map<String, String> headers,
  }) async {
    return await http.post(
      Uri.parse(endPoint),
      body: body,
      headers: headers,
    );
  }

  Future<bool> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    http.Response response = await post(
      endPoint: ApiRequest.login,
      body: {ApiConstants.email: email, ApiConstants.password: password},
      headers: {
        ApiConstants.acceptLanguage: appSettingsSharedPreferences.defaultLocale,
      },
    );

    var json = jsonDecode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      LoginResponse loginResponse = LoginResponse.fromJson(json);
      LoginModel loginModel = loginResponse.toDomain();
      appSettingsSharedPreferences.setToken(loginModel.accessToken);
      appSettingsSharedPreferences.saveUserInfo(loginModel.user);
      appSettingsSharedPreferences.setLoggedIn();
      return true;
    }

    showSnackBar(
      context: context,
      message: json[ApiConstants.errorMassage] ?? 'Error',
      error: true,
    );
    return false;
  }

  Future<bool> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String phone,
    String? registerBy,
    required BuildContext context,
  }) async {
    http.Response response = await post(
      endPoint: ApiRequest.register,
      body: {
        ApiConstants.email: email,
        ApiConstants.password: password,
        ApiConstants.passwordConfirmation: passwordConfirmation,
        ApiConstants.authName: name,
        ApiConstants.phone: phone,
        ApiConstants.registerBy: 'email',
      },
      headers: {},
    );

    var json = jsonDecode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return true;
    }

    showSnackBar(
      context: context,
      error: true,
      message: json[ApiConstants.errorMassage] ?? 'error',
    );
    return false;
  }
}
