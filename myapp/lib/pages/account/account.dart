import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myapp/common/api/apis.dart';
import 'package:myapp/common/entitys/entitys.dart';
import 'package:myapp/common/utils/authentication.dart';
import 'package:myapp/common/utils/utils.dart';
import 'package:myapp/common/values/values.dart';
import 'package:myapp/common/widgets/widgets.dart';
import 'package:myapp/global.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final account = AccountResponseEntity().obs;
  final edit = false.obs;
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _schoolController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _loadAllData();
  }

  // 读取所有数据
  _loadAllData() async {
    var userid = Global.profile.token;
    print(userid);
    account.value = await AccountAPI.accountInfo('777');
  }

  _editAccountData() {
    _usernameController.value = TextEditingValue(text: account.value.username!);
    _schoolController.value = TextEditingValue(text: account.value.school!);
    edit.value = true;
  }

  _saveAccountData() async {
    account.value.username = _usernameController.value.text;
    account.value.school = _schoolController.value.text;
    AccountChangeRequest params = AccountChangeRequest(
      userid: account.value.userid!,
      username: _usernameController.value.text,
      school: _schoolController.value.text,
    );

    var temp = await AccountAPI.accountSaveChange(params);
    print(temp.succeed);
    edit.value = false;
  }

  Widget _buildTopID() {
    return Container(
      width: 300.w,
      height: 150.h,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: ClipOval(
              child: Image.asset("assets/images/Girl_2.JPG",
                  width: 80, height: 80, fit: BoxFit.cover),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Text('用户: ${Global.profile.token}'),
          ),
        ],
      ),
    );
  }

  Widget _buildCountForm() {
    print(account.value.username);
    return Container(
      width: 330.w,
      height: 80.h,
      decoration: new BoxDecoration(
        border: new Border.all(
          color: Colors.pink,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 100.w,
            child: Column(
              children: <Widget>[
                Spacer(),
                Obx(() => Text("${account.value.activitynum}")),
                Divider(
                  thickness: 0,
                  height: 5,
                ),
                Text("活动"),
                Spacer(),
              ],
            ),
          ),
          VerticalDivider(
            color: Colors.pink[200],
            thickness: 2,
          ),
          Container(
            width: 100.w,
            child: Column(
              children: <Widget>[
                Spacer(),
                Obx(() => Text("${account.value.attentnum}")),
                Divider(
                  thickness: 0,
                  height: 5,
                ),
                Text("参与"),
                Spacer(),
              ],
            ),
          ),
          VerticalDivider(
            color: Colors.pink[200],
            thickness: 2,
          ),
          Container(
            width: 100.w,
            child: Column(
              children: <Widget>[
                Spacer(),
                Obx(() => Text("${account.value.commentnum}")),
                Divider(
                  thickness: 0,
                  height: 5,
                ),
                Text(
                  "评论",
                  style: TextStyle(fontWeight: FontWeight.w100),
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChangeForm() {
    return Obx(() => Container(
          margin: EdgeInsets.only(top: 20),
          width: 330.w,
          height: 420.h,
          //color: Colors.blue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Spacer(),
                  edit.value == false
                      ? ElevatedButton(
                          onPressed: _editAccountData, child: Text("编辑"))
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.pinkAccent[400]),
                          onPressed: _saveAccountData,
                          child: Text("保存")),
                ],
              ),
              Text("昵称："),
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: edit.value == false
                    ? Text("${account.value.username}")
                    : TextField(
                        controller: _usernameController,
                        keyboardType: TextInputType.name,
                      ),
              ),
              Divider(
                height: 30,
              ),
              Text("身份："),
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Text('本科生'),
              ),
              Divider(
                height: 30,
              ),
              Text("学校："),
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: edit.value == false
                    ? Text("${account.value.school}")
                    : TextField(
                        controller: _schoolController,
                        keyboardType: TextInputType.text,
                      ),
              ),
              Divider(
                height: 30,
              ),
            ],
          ),
        ));
  }

  Widget _buildOutButton() {
    return Container(
      width: 330.w,
      height: 50.h,
      child: Container(
        margin: EdgeInsets.only(bottom: duSetHeight(20)),
        child: btnFlatButtonWidget(
          onPressed: () => goLoginPage(context),
          width: 294,
          gbColor: Colors.pink,
          fontColor: AppColors.primaryText,
          title: "退出",
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildTopID(),
          _buildCountForm(),
          _buildChangeForm(),
          Divider(
            height: 25,
            thickness: 2,
            color: Colors.grey,
            indent: 15,
            endIndent: 15,
          ),
          _buildOutButton(),
        ],
      ),
    );
  }
}
