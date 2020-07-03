import 'package:flutter/material.dart';
import 'package:driver_app/models/driver.dart';
import 'package:driver_app/screens/wrapper.dart';
import 'package:driver_app/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Driver>.value(
        value: AuthService().user,
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}