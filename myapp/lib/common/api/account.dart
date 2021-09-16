import 'package:myapp/common/entitys/entitys.dart';
import 'package:myapp/common/utils/utils.dart';

class AccountAPI {
  static Future<AccountResponseEntity> accountInfo(String userid) async {
    var response = await HttpUtil().get(
      '/api/account/' + userid + '/',
    );
    return AccountResponseEntity.fromJson(response);
  }

  /// Signup
  static Future<UserResponseSignupEntity> signup(
      {UserRequestSignupEntity? params}) async {
    var response = await HttpUtil().post('/api/user/signup', params: params);
    return UserResponseSignupEntity.fromJson(response);
  }

  static Future<SucceedEntity> accountSaveChange(
      AccountChangeRequest params) async {
    var response =
        await HttpUtil().patch('/api/account/777/change', params: params);
    return SucceedEntity.fromJson(response);
  }
}
