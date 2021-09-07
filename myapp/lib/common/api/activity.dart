import 'package:myapp/common/entitys/entitys.dart';
import 'package:myapp/common/utils/utils.dart';

class ActivityAPI {
  /// 翻页
  /// refresh 是否刷新
  static Future<ActivityResponseEntity> activityPageList({
    bool refresh = false,
  }) async {
    var response = await HttpUtil().get(
      '/api/avtivity/home',
      refresh: refresh,
    );
    return ActivityResponseEntity.fromJson(response);
  }
}
