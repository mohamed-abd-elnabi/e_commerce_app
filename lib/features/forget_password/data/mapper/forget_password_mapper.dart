import 'package:shop_avatar/core/extinsion/extinsion.dart';
import 'package:shop_avatar/features/forget_password/data/response/forget_password_response.dart';
import 'package:shop_avatar/features/forget_password/domain/models/forget_password_model.dart';

extension ForgerPasswordMapper on ForgetPasswordResponse {
  ForgetPasswordModel toDomain() {
    return ForgetPasswordModel(
        result: result.onNull(),
        message: message.onNull(),
        code: code.onNull());
  }
}
