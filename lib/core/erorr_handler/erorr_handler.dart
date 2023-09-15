import 'package:dio/dio.dart';
import 'package:shop_avatar/core/extinsion/extinsion.dart';

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
