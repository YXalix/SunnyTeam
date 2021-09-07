import 'package:myapp/common/entitys/entitys.dart';
import 'package:myapp/common/utils/utils.dart';

/// 用户
class UserAPI {
  /// 登录
  static Future<UserResponseLoginEntity> login(
      {UserRequestLoginEntity? params}) async {
    var response = await HttpUtil().post('/api/user/login', params: params);
    return UserResponseLoginEntity.fromJson(response);
  }

  /// Signup
  static Future<UserResponseSignupEntity> signup(
      {UserRequestSignupEntity? params}) async {
    var response = await HttpUtil().post('/api/user/signup', params: params);
    return UserResponseSignupEntity.fromJson(response);
  }
}
