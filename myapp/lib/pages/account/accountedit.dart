import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myapp/common/entitys/entitys.dart';
import 'package:myapp/common/utils/utils.dart';

import 'package:myapp/common/values/values.dart';
import 'package:myapp/common/widgets/widgets.dart';
import 'package:myapp/global.dart';

class AccountEditPage extends StatefulWidget {
  AccountEditPage({Key? key}) : super(key: key);

  @override
  _AccountEditPageState createState() => _AccountEditPageState();
}

class _AccountEditPageState extends State<AccountEditPage> {
  AccountResponseEntity account = Get.arguments as AccountResponseEntity;

  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _schoolController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usernameController.text = account.username!;
    setState(() {});
    //_schoolController.text = account.school!;
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

  Widget _buildInputForm() {
    return Container(
      width: duSetWidth(295),
      margin: EdgeInsets.only(top: duSetHeight(49)),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _usernameController,
            keyboardType: TextInputType.number,
          ),
          inputTextEdit(
            controller: _schoolController,
            keyboardType: TextInputType.visiblePassword,
            hintText: 'password',
            isPassword: true,
          ),

          //buttons
          Container(
            height: duSetHeight(44),
            margin: EdgeInsets.only(top: duSetHeight(15)),
            child: Row(
              children: [
                // 注册
                btnFlatButtonWidget(
                  onPressed: () => {},
                  gbColor: AppColors.thirdElement,
                  title: "Sign up",
                ),
                Spacer(),
                // 登录
                btnFlatButtonWidget(
                  onPressed: () => {},
                  gbColor: AppColors.primaryElement,
                  title: "Sign in",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //print(account.activitynum);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: transparentAppBar(
        context: context,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primaryText,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            iconSize: 30,
            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
            icon: Icon(
              Icons.save,
              color: Colors.blue,
            ),
            onPressed: () {
              toastInfo(msg: '这是编辑界面');
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Center(
                child: _buildTopID(),
              ),
            ),
            _buildInputForm(),
          ],
        ),
      ),
    );
  }
}
