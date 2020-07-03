import 'package:flutter/material.dart';
import 'package:driver_app/models/driver.dart';
import 'package:driver_app/screens/authenticate/authenticate.dart';
import 'package:driver_app/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Driver>(context);
    
    //return either home or authenticate widget
    if(user == null){
      return Authenticate();
    }
    else{
      return Home();
    }
  }
}