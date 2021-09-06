import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/global.dart';
import 'package:myapp/pages/welcome/welcome.dart';
import 'package:myapp/routes.dart';

void main() => Global.init().then((e) => runApp(new MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material App",
      routes: staticRoute,
      home: WelcomePage(),
    );
  }
}
