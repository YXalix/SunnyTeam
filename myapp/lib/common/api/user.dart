import 'package:myapp/common/entitys/entitys.dart';
import 'package:myapp/common/utils/utils.dart';

/// 用户
class UserAPI {
  /// 登录
  static Future<UserResponseLoginEntity> login(
      {UserRequestLoginEntity? params}) async {
    var response = await HttpUtil().post('/user/login', params: params);
    return UserResponseLoginEntity.fromJson(response);
  }

  static Future<UserRequestLoginEntity> test() async {
    var response = await HttpUtil().get('/temp');
    return UserRequestLoginEntity.fromJson(response);
  }
}
