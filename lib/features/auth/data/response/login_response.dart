class LoginResponse {
  bool? result;
  String? message;
  String? accessToken;
  String? tokenType;
  String? expiresAt;
  UserResponse? user;
/*
الدالة fromJson هي دالة موجودة في الكلاس LoginResponse وتستقبل وسيطة
واحدة من نوعMap<String, dynamic> json  تمثل JSON. الهدف من هذه الدالة هو استخراج البيانات
 الـ JSON وتخزينها في متغيرات محددة داخل كائن LoginResponse
 */
  LoginResponse.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresAt = json['expires_at'];
    user = json['user'] != null ? UserResponse.fromJson(json['user']) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['message'] = message;
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['expires_at'] = expiresAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class UserResponse {
  int? id;
  String? type;
  String? name;
  String? email;
  String? avatar;
  String? avatarOriginal;
  String? phone;

  UserResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
    avatarOriginal = json['avatar_original'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['name'] = name;
    data['email'] = email;
    data['avatar'] = avatar;
    data['avatar_original'] = avatarOriginal;
    data['phone'] = phone;
    return data;
  }
}
