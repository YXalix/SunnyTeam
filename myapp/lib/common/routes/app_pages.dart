import 'package:get/get.dart';
import 'package:myapp/pages/account/accountedit.dart';
import 'package:myapp/pages/application/application.dart';
import 'package:myapp/pages/avtivityhome/index.dart';
import 'package:myapp/pages/nofound/index.dart';
import 'package:myapp/pages/sign_in/sign_in.dart';
import 'package:myapp/pages/sign_up/sign_up.dart';
import 'package:myapp/pages/welcome/welcome.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.start;

  static final unknownRoute = GetPage(
    name: AppRoutes.NotFound, //AppRoutes.NotFound,
    page: () => NoFoundpage(),
  );

  static final routes = [
    GetPage(
      name: AppRoutes.start,
      page: () => WelcomePage(),
    ),
    GetPage(
      name: '/nnnn',
      page: () => NoFoundpage(),
    ),
    GetPage(
      name: AppRoutes.signin,
      page: () => SignInPage(),
    ),
    /*GetPage(
      name: AppRoutes.weclome,
      page: () => WelcomePage(),
    ),*/
    GetPage(
      name: AppRoutes.signup,
      page: () => SignUpPage(),
    ),
    GetPage(name: AppRoutes.home, page: () => ApplicationPage(), children: [
      GetPage(
        name: AppRoutes.accountedit,
        page: () => AccountEditPage(),
      )
    ]),
    GetPage(
      name: AppRoutes.activityindex,
      page: () => ActivityPage(),
    ),
  ];
}
