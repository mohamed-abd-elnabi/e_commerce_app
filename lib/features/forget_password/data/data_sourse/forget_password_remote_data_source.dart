import 'package:shop_avatar/core/network/api/app_api.dart';
import '../request/forget_password_request.dart';
import '../response/forget_password_response.dart';

abstract class RemoteForgetPasswordDataSource {
  Future<ForgetPasswordResponse> forgetPassword(
      ForgetPasswordRequest forgetPasswordRequest);
}

class RemoteForgetPasswordDataSourceImplement
    implements RemoteForgetPasswordDataSource {
  final AppApi _appApi;

  RemoteForgetPasswordDataSourceImplement(this._appApi);

  @override
  Future<ForgetPasswordResponse> forgetPassword(
      ForgetPasswordRequest forgetPasswordRequest) async {
    return await _appApi.forgetPassword(forgetPasswordRequest.email);
  }
}
