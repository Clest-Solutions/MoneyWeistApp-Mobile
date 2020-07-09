import 'package:driver_app/models/driver.dart';
import 'package:driver_app/services/auth.dart';
import 'package:driver_app/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Driver>(context);
    return StreamBuilder(builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return Loading();
      } else {
        DriverData _userData = snapshot.data;
        return Scaffold(
          
        );
      }
    });
  }
}
