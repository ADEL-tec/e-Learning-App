import '../entities/user.dart';

import '../utils/http_util.dart';

class UserAPI {
  static Future<UserLoginResponseEntity> login({
    LoginRequestEntity? params,
  }) async {
    var response = await HttpUtil().post(
      "api/auth/register",
      queryParameters: params?.toJson(),
    );

    return UserLoginResponseEntity.fromMap(response);
  }
}
