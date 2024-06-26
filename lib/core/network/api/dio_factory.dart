import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shop_avatar/core/constants.dart';
import 'package:shop_avatar/core/storage/local/database/shared_preferences/app_setings_shared_preferences.dart';

class DioFactory {
  AppSettingsSharedPreferences appSettingsSharedPreferences =
      AppSettingsSharedPreferences();

  Future<Dio> getDio() async {
    Dio dio = Dio();

    dio.options = BaseOptions(
      baseUrl: ApiRequest.baseUrl,
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 120),
      headers: getHeaders(),
    );
    InterceptorsWrapper interceptorsWrapper = InterceptorsWrapper(
      onRequest: (
        RequestOptions options,
        RequestInterceptorHandler handler,
      ) {
        options.headers[ApiConstants.authorization] = getAuthorization();
        return handler.next(options);
      },
    );
    dio.interceptors.add(interceptorsWrapper);

    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
        ),
      );
    }

    return dio;
  }

  String getAuthorization() {
    return '${ApiConstants.bearer} ${appSettingsSharedPreferences.defaultToken}';
  }

  Map<String, String> getHeaders() {
    return {
      ApiConstants.authorization: getAuthorization(),
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      ApiConstants.acceptLanguage: appSettingsSharedPreferences.defaultLocale,
    };
  }
}
