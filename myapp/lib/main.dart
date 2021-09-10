import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:myapp/common/provider/provider.dart';
import 'package:myapp/common/routes/app_pages.dart';
import 'package:myapp/global.dart';
import 'package:provider/provider.dart';

void main() => Global.init().then((e) => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AppState>.value(
            value: Global.appState,
          ),
        ],
        child: Consumer<AppState>(builder: (context, appState, _) {
          if (appState.isGrayFilter) {
            return ColorFiltered(
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.color),
              child: MyApp(),
            );
          } else {
            return MyApp();
          }
        }),
      ),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Material App",
      //routes: staticRoute,
      getPages: AppPages.routes,
      unknownRoute: AppPages.unknownRoute,
      initialRoute: AppPages.INITIAL,
      debugShowCheckedModeBanner: false,
    );
  }
}
