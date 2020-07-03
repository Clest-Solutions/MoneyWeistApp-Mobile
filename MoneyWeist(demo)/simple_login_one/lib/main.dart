import 'package:flutter/material.dart';
import 'package:simple_login_one/login_page.dart';
import 'package:simple_login_one/main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final routes = <String, WidgetBuilder>{
    Login.tag: (context) => Login(),
    MainPage.tag: (context) => MainPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
      routes: routes,
    );
  }
}


