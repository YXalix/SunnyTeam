import 'package:myapp/pages/application/application.dart';
import 'package:myapp/pages/sign_in/sign_in.dart';
import 'package:myapp/pages/sign_up/sign_up.dart';

var staticRoute = {
  "/sign-in": (context) => SignInPage(),
  "/sign-up": (context) => SignUpPage(),
  "/app": (context) => ApplicationPage(), // 主程序
};
