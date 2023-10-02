import 'package:dartz/dartz.dart';
import 'package:shop_avatar/core/erorr_handler/erorr_handler.dart';
import 'package:shop_avatar/features/forget_password/data/mapper/forget_password_mapper.dart';
import 'package:shop_avatar/features/forget_password/data/request/forget_password_request.dart';
import 'package:shop_avatar/features/forget_password/domain/models/forget_password_model.dart';
import 'package:shop_avatar/features/forget_password/domain/repository/forget_passwor_repository.dart';
import '../../../../core/internet_checker/internet_checker.dart';
import '../../data/data_sourse/forget_password_remote_data_source.dart';

class ForgetPasswordRepositoryImpl extends ForgetPasswordRepository {
  RemoteForgetPasswordDataSource _remoteForgetPasswordDataSource;
  NetworkInfo _networkInfo;

  ForgetPasswordRepositoryImpl(
      this._remoteForgetPasswordDataSource, this._networkInfo);

  @override
  Future<Either<Failure, ForgetPasswordModel>> forgetPassword(
      ForgetPasswordRequest forgetPasswordRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteForgetPasswordDataSource
            .forgetPassword(forgetPasswordRequest);
        return Right(response.toDomain());
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(Failure(
          code: ResponseCode.NO_INTERNET_CONNECTION,
          message: 'NO_INTERNT_CONNECTION'));
    }
  }
}
