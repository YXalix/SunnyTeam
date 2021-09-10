import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:myapp/common/api/activity.dart';
import 'package:myapp/common/entitys/entitys.dart';
import 'package:myapp/pages/main/activity_item_widget.dart';
import 'package:skeleton_text/skeleton_text.dart';

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

  // 读取所有数据
  _loadAdditonData({bool refresh = false}) async {
    ActivityResponseEntity? newactivitys =
        await ActivityAPI.activityPageList(refresh: refresh);
    _activityList?.activitys.addAll(newactivitys.activitys);
    if (mounted) {
      setState(() {});
    }
  }

  // no use
  Widget _buildTwoPart() {
    return Container();
  }

  // activitylist
  Widget _buildActivityList() {
    return _activityList == null
        ? SkeletonAnimation(
            shimmerColor: Colors.grey,
            borderRadius: BorderRadius.circular(20),
            shimmerDuration: 1000,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.only(top: 40),
            ),
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
      enableControlFinishLoad: false,
      controller: _controller,
      header: ClassicalHeader(),
      onRefresh: () async {
        await _loadAllData(
          refresh: true,
        );
        _controller?.finishRefresh();
      },
      onLoad: () async {
        _loadAdditonData(
          refresh: true,
        );
        _controller?.finishLoad();
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
