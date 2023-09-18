import 'package:dartz/dartz.dart';
import 'package:shop_avatar/features/forget_password/data/request/forget_password_request.dart';
import 'package:shop_avatar/features/forget_password/domain/models/forget_password_model.dart';

import '../../../../core/erorr_handler/erorr_handler.dart';

abstract class ForgetPasswordRepository {
  Future<Either<Failure, ForgetPasswordModel>> forgetPassword(
      ForgetPasswordRequest forgetPasswordRequest);
}
