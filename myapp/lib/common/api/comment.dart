import 'package:myapp/common/entitys/entitys.dart';
import 'package:myapp/common/utils/utils.dart';

class CommentAPI {
  /// 翻页
  /// refresh 是否刷新
  static Future<CommentListResponseEntity> commentPageList() async {
    var response = await HttpUtil().get(
      '/api/activity/777/comments',
    );
    return CommentListResponseEntity.fromJson(response);
  }
}
