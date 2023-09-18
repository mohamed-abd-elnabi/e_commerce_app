import 'package:json_annotation/json_annotation.dart';
part 'forget_password_response.g.dart';

@JsonSerializable()
class ForgetPasswordResponse {
  @JsonKey(name: 'result')
  bool? result;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'code')
  int? code;

  ForgetPasswordResponse({
    required this.result,
    required this.message,
    required this.code,
  });
  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordResponseToJson(this);
}
