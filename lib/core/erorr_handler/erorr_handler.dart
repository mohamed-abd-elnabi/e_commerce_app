import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shop_avatar/core/extinsion/extinsion.dart';

import '../../routes/routes.dart';
import '../resources/manager_strings.dart';

class Failure {
  int code;
  String message;

  Failure({
    required this.code,
    required this.message,
  });
}

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = Failure(
        code: error.response!.statusCode.parseError(),
        message: error.response?.data['message'] ??
            error.response?.data['errors'].toString() ??
            ManagerStrings.error,
      );
    } else {
      failure = Failure(
        code: 400,
        message: ManagerStrings.error,
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
          message: 'SUCCESS',
        );
      case TypeHandler.NO_CONTENT:
        return Failure(
          code: ResponseCode.NO_CONTENT,
          message: 'NO_CONTENT',
        );
      case TypeHandler.BAD_REQUEST:
        return Failure(
          code: ResponseCode.BAD_REQUEST,
          message: 'BAD_REQUEST',
        );
      case TypeHandler.FORBIDDEN:
        return Failure(
          code: ResponseCode.FORBIDDEN,
          message: 'FORBIDDEN',
        );
      case TypeHandler.UNAUTHORISED:
        Get.offAllNamed(
          Routes.loginScreen,
        );
        return Failure(
          code: ResponseCode.UNAUTHORISED,
          message: 'UNAUTHORISED',
        );
      case TypeHandler.NOT_FOUND:
        return Failure(
          code: ResponseCode.NOT_FOUND,
          message: 'NOT_FOUND',
        );
      case TypeHandler.INTERNAL_SERVER_ERROR:
        return Failure(
          code: ResponseCode.INTERNAL_SERVER_ERROR,
          message: 'INTERNAL_SERVER_ERROR',
        );
      case TypeHandler.CONNECT_TIMEOUT:
        return Failure(
          code: ResponseCode.CONNECT_TIMEOUT,
          message: 'CONNECT_TIMEOUT',
        );
      case TypeHandler.CANCEL:
        return Failure(
          code: ResponseCode.CANCEL,
          message: 'CANCEL',
        );
      case TypeHandler.RECEIVE_TIMEOUT:
        return Failure(
          code: ResponseCode.RECEIVE_TIMEOUT,
          message: 'RECIEVE_TIMEOUT',
        );
      case TypeHandler.SEND_TIMEOUT:
        return Failure(
          code: ResponseCode.SEND_TIMEOUT,
          message: 'SEND_TIMEOUT',
        );
      case TypeHandler.CACHE_ERROR:
        return Failure(
          code: ResponseCode.CACHE_ERROR,
          message: 'CACHE_ERROR',
        );
      case TypeHandler.NO_INTERNET_CONNECTION:
        return Failure(
          code: ResponseCode.NO_INTERNET_CONNECTION,
          message: 'NO_INTERNT_CONNECTION',
        );
      default:
        return Failure(
          code: ResponseCode.UNKNOWN,
          message: 'UNKNOWN',
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
