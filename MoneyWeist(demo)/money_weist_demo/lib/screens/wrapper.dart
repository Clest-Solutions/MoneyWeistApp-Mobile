import 'package:flutter/material.dart';
import 'package:money_weist_demo/models/user.dart';
import 'package:money_weist_demo/screens/authenticate/authenticate.dart';
import 'package:money_weist_demo/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    
    //return either home or authenticate widget
    if(user == null){
      return Authenticate();
    }
    else{
      return Home();
    }
  }
}