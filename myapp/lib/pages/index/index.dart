import 'package:flutter/material.dart';
import 'package:myapp/global.dart';
import 'package:myapp/pages/application/application.dart';
import 'package:myapp/pages/sign_in/sign_in.dart';
import 'package:myapp/pages/welcome/welcome.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 734),
      builder: () => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Global.isFirstOpen == true
            ? WelcomePage()
            : Global.isOfflineLogin == true
                ? ApplicationPage()
                : SignInPage(),
      ),
    );
  }
}
