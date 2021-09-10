import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/common/routes/app_pages.dart';

class NotfoundView extends StatelessWidget {
  const NotfoundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("路由没有找到"),
      ),
      body: ListTile(
        title: Text("返回首页"),
        subtitle: Text('Get.offAllNamed(AppRoutes.home)'),
        onTap: () => Get.offAllNamed(AppRoutes.home),
      ),
    );
  }
}

class NoFoundpage extends StatefulWidget {
  NoFoundpage({Key? key}) : super(key: key);

  @override
  _NoFoundpageState createState() => _NoFoundpageState();
}

class _NoFoundpageState extends State<NoFoundpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("路由没有找到"),
      ),
      body: ListTile(
        title: Text("返回首页"),
        subtitle: Text('Get.offAllNamed(AppRoutes.home)'),
        onTap: () => Get.offAllNamed(AppRoutes.home),
      ),
    );
  }
}
