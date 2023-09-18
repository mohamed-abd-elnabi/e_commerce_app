import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shop_avatar/core/extinsion/extinsion.dart';

import '../../routes/routes.dart';
import '../resources/manager_strings.dart';

class Failure {
  int code;
  String massege;

  Failure({
    required this.code,
    required this.massege,
  });
}

class ErrorHandler implements Exception {
  late Failure failure;
  ErrorHandler.handel(dynamic error) {
    if (error is DioException) {
      failure = Failure(
        code: error.response!.statusCode.parseError(),
        massege: error.response?.data['message'] ??
            error.response?.data['errors'].toString() ??
            'error',
      );
    } else {
      failure = Failure(
        code: 400,
        massege: 'error',
      );
    }
  }
}

enum TypeHandler {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  UNKNOWN
}

extension DataSourceExtension on TypeHandler {
  Failure getFailure() {
    switch (this) {
      case TypeHandler.SUCCESS:
        return Failure(
          code: ResponseCode.SUCCESS,
          massege: 'SUCCESS',
        );
      case TypeHandler.NO_CONTENT:
        return Failure(
          code: ResponseCode.NO_CONTENT,
          massege: 'NO_CONTENT',
        );
      case TypeHandler.BAD_REQUEST:
        return Failure(
          code: ResponseCode.BAD_REQUEST,
          massege: 'BAD_REQUEST',
        );
      case TypeHandler.FORBIDDEN:
        return Failure(
          code: ResponseCode.FORBIDDEN,
          massege: 'FORBIDDEN',
        );
      case TypeHandler.UNAUTHORISED:
        Get.offAllNamed(
          Routes.loginScreen,
        );
        return Failure(
          code: ResponseCode.UNAUTHORISED,
          massege: 'UNAUTHORISED',
        );
      case TypeHandler.NOT_FOUND:
        return Failure(
          code: ResponseCode.NOT_FOUND,
          massege: 'NOT_FOUND',
        );
      case TypeHandler.INTERNAL_SERVER_ERROR:
        return Failure(
          code: ResponseCode.INTERNAL_SERVER_ERROR,
          massege: 'INTERNAL_SERVER_ERROR',
        );
      case TypeHandler.CONNECT_TIMEOUT:
        return Failure(
          code: ResponseCode.CONNECT_TIMEOUT,
          massege: 'CONNECT_TIMEOUT',
        );
      case TypeHandler.CANCEL:
        return Failure(
          code: ResponseCode.CANCEL,
          massege: 'CANCEL',
        );
      case TypeHandler.RECEIVE_TIMEOUT:
        return Failure(
          code: ResponseCode.RECEIVE_TIMEOUT,
          massege: 'RECIEVE_TIMEOUT',
        );
      case TypeHandler.SEND_TIMEOUT:
        return Failure(
          code: ResponseCode.SEND_TIMEOUT,
          massege: 'SEND_TIMEOUT',
        );
      case TypeHandler.CACHE_ERROR:
        return Failure(
          code: ResponseCode.CACHE_ERROR,
          massege: 'CACHE_ERROR',
        );
      case TypeHandler.NO_INTERNET_CONNECTION:
        return Failure(
          code: ResponseCode.NO_INTERNET_CONNECTION,
          massege: 'NO_INTERNT_CONNECTION',
        );
      default:
        return Failure(
          code: ResponseCode.UNKNOWN,
          massege: 'UNKNOWN',
        );
    }
  }
}

class ResponseCode {
  static const int SUCCESS = 200;

  static const int NO_CONTENT = 201;

  static const int BAD_REQUEST = 400;

  static const int FORBIDDEN = 403;

  static const int UNAUTHORISED = 401;

  static const int NOT_FOUND = 404;

  static const int UNVERIFIED_USER = 423;

  static const int INTERNAL_SERVER_ERROR = 500;

  static const int CONNECT_TIMEOUT = -1;

  static const int CANCEL = -2;

  static const int RECEIVE_TIMEOUT = -3;

  static const int SEND_TIMEOUT = -4;

  static const int CACHE_ERROR = -5;

  static const int NO_INTERNET_CONNECTION = -6;

  static const int UNKNOWN = -7;
}
