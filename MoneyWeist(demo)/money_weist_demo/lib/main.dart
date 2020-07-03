import 'package:flutter/material.dart';
import 'package:money_weist_demo/models/user.dart';
import 'package:money_weist_demo/screens/wrapper.dart';
import 'package:money_weist_demo/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user,
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}


