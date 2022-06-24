import 'core.dart';

/// 请求验证码
class AuthTokenModel extends BaseModel {
  late final int userId;
  late final String token;

  @override
  AuthTokenModel fromJson(dynamic data) {
    userId = data['user_id'];
    token = data['token'];

    return this;
  }
}
