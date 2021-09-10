import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/common/api/apis.dart';
import 'package:myapp/common/entitys/entitys.dart';
import 'package:myapp/common/utils/utils.dart';
import 'package:myapp/common/values/values.dart';
import 'package:myapp/common/widgets/widgets.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // userID password Name school的控制器
  final TextEditingController _userIDController = TextEditingController();
  final TextEditingController _password1Controller = TextEditingController();
  final TextEditingController _password2Controller = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _schoolController = TextEditingController();

  // 返回上一页
  _handleNavPop() {
    Navigator.pop(context);
  }

  _handleSignUp() async {
    if (!duCheckAccountLength(_userIDController.value.text, 10)) {
      toastInfo(msg: '用户名不能为空或者大于10位');
      return;
    }
    if (!duIsAccount(_userIDController.value.text, 10)) {
      toastInfo(msg: '用户名只能是数字');
      return;
    }
    if (!duCheckStringLength(_password1Controller.value.text, 6)) {
      toastInfo(msg: '密码不能小于6位');
      return;
    }
    if (!duCheckStringLength(_password2Controller.value.text, 6)) {
      toastInfo(msg: '密码不能小于6位');
      return;
    }
    if (!duCheckPasswordEqual(
        _password1Controller.value.text, _password2Controller.value.text)) {
      toastInfo(msg: '密码不一致');
      return;
    }
    if (!duCheckStringLength(_userNameController.value.text, -1)) {
      toastInfo(msg: 'username is null');
      return;
    }
    if (!duCheckStringLength(_schoolController.value.text, -1)) {
      toastInfo(msg: 'school is null');
      return;
    }
    UserRequestSignupEntity params = UserRequestSignupEntity(
      userid: _userIDController.value.text,
      userpassword: _password1Controller
          .value.text, //duSHA256(_passController.value.text),
      username: _userNameController.value.text,
      school: _schoolController.value.text,
    );

    UserResponseSignupEntity res = await UserAPI.signup(params: params);
    if (res.userid.isEmpty) {
      toastInfo(msg: 'userid is existed');
      return;
    }
    Get.back(result: 'success');
    //Navigator.pop(context);
  }

  // logo
  Widget _buildLogo() {
    return Container(
      margin: EdgeInsets.only(top: duSetHeight(50)),
      child: Text(
        "Sign up",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: duSetFontSize(24),
          height: 1,
        ),
      ),
    );
  }

  // 注册表单
  Widget _buildInputForm() {
    return Container(
      width: duSetWidth(295),
      margin: EdgeInsets.only(top: duSetHeight(49)),
      child: Column(
        children: [
          // userID input
          inputTextEdit(
            controller: _userIDController,
            keyboardType: TextInputType.number,
            hintText: "account",
            marginTop: 0,
          ),
          // password1 input
          inputTextEdit(
            controller: _password1Controller,
            keyboardType: TextInputType.visiblePassword,
            hintText: "password",
          ),
          // password2 input
          inputTextEdit(
            controller: _password2Controller,
            keyboardType: TextInputType.visiblePassword,
            hintText: "repeat password",
            isPassword: true,
          ),
          // username input
          inputTextEdit(
            controller: _userNameController,
            keyboardType: TextInputType.text,
            hintText: "full name",
            isPassword: false,
          ),
          // school input
          inputTextEdit(
            controller: _schoolController,
            keyboardType: TextInputType.text,
            hintText: "school",
            isPassword: false,
          ),

          // 创建
          Container(
            height: duSetHeight(44),
            margin: EdgeInsets.only(top: duSetHeight(20)),
            child: btnFlatButtonWidget(
              onPressed: _handleSignUp,
              width: 295,
              fontWeight: FontWeight.w600,
              title: "Create an account",
            ),
          ),
          // Spacer(),
        ],
      ),
    );
  }

  // 有账号
  Widget _buildHaveAccountButton() {
    return Container(
      margin: EdgeInsets.only(bottom: duSetHeight(20)),
      child: btnFlatButtonWidget(
        onPressed: _handleNavPop,
        width: 294,
        gbColor: AppColors.secondaryElement,
        fontColor: AppColors.primaryText,
        title: "I have an account",
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(Get.arguments);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: transparentAppBar(
        context: context,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.info_outline,
              color: AppColors.primaryText,
            ),
            onPressed: () {
              toastInfo(msg: '这是注册界面');
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Divider(height: 1),
            _buildLogo(),
            _buildInputForm(),
            Spacer(),
            _buildHaveAccountButton(),
          ],
        ),
      ),
    );
  }
}
