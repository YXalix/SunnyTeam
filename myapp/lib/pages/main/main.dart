import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:myapp/common/api/activity.dart';
import 'package:myapp/common/entitys/entitys.dart';
import 'package:myapp/common/utils/screen.dart';
import 'package:myapp/common/values/colors.dart';
import 'package:myapp/pages/main/activity_item_widget.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  EasyRefreshController? _controller; // EasyRefresh控制器

  ActivityResponseEntity? _activityList;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    _loadAllData();
  }

  // 读取所有数据
  _loadAllData({bool refresh = false}) async {
    _activityList = await ActivityAPI.activityPageList(refresh: refresh);
    if (mounted) {
      setState(() {});
    }
  }

  // no use
  Widget _buildTwoPart() {
    return Container();
  }

  // 新闻列表
  Widget _buildActivityList() {
    return _activityList == null
        ? Container(
            height: duSetHeight(161 * 5 + 100),
            color: AppColors.primaryElement,
          )
        : Column(
            children: _activityList!.activitys.map((item) {
              return Column(
                children: <Widget>[
                  activityItem(item),
                  Divider(
                    height: 1,
                  ),
                ],
              );
            }).toList(),
          );
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      enableControlFinishRefresh: true,
      controller: _controller,
      header: ClassicalHeader(),
      onRefresh: () async {
        await _loadAllData(
          refresh: true,
        );
        _controller?.finishRefresh();
      },
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildTwoPart(),
            Divider(height: 1),
            _buildActivityList(),
          ],
        ),
      ),
    );
  }
}
