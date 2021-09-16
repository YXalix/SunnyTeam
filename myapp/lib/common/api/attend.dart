import 'package:myapp/common/entitys/entitys.dart';
import 'package:myapp/common/utils/utils.dart';

class AttendAPI {
  static Future<SucceedEntity> attendActivity(
      {AttendRequestEntity? params}) async {
    var response =
        await HttpUtil().post('/api/activity/777/attend', params: params);
    return SucceedEntity.fromJson(response);
  }
}
