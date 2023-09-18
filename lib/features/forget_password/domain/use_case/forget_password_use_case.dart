import 'package:dartz/dartz.dart';
import 'package:shop_avatar/core/erorr_handler/erorr_handler.dart';
import 'package:shop_avatar/core/use_case/base_use_case.dart';
import 'package:shop_avatar/features/forget_password/domain/models/forget_password_model.dart';
import 'package:shop_avatar/features/forget_password/domain/repository/forget_passwor_repository.dart';

import '../../data/request/forget_password_request.dart';

class ForgetPasswordUseCase
    implements BaseUseCase<ForgetPasswordInput, ForgetPasswordModel> {
  final ForgetPasswordRepository _repository;

  ForgetPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, ForgetPasswordModel>> execute(
      ForgetPasswordInput input) async {
    return await _repository.forgetPassword(
      ForgetPasswordRequest(
        email: input.email,
      ),
    );
  }
}

class ForgetPasswordInput {
  String email;

  ForgetPasswordInput({
    required this.email,
  });
}
