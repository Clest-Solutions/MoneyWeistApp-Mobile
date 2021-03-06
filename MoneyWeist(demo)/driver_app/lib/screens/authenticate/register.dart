import 'package:flutter/material.dart';
import 'package:driver_app/Animations/FadeAnimation.dart';
import 'package:driver_app/services/auth.dart';
import 'package:driver_app/services/database.dart';
import 'package:driver_app/shared/constants.dart';
import 'package:driver_app/shared/loading.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class Register extends StatefulWidget {
  @override
  final Function toggleView;

  Register({this.toggleView});

  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final format = DateFormat("dd-MM-yyy");
  final _formKey = GlobalKey<FormState>();
  final DatabaseService database = DatabaseService();

  //textfield state
  String email = "";
  String password = "";
  String error = "";
  String name = "";
  String phoneNumber = "";

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: primColor.shade600,
            body: Container(
              padding: EdgeInsets.all(15),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 100, 5, 5),
                child: ListView(
                  children: <Widget>[
                    FadeAnimation(
                        1.2,
                        Text(
                          "Register",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    FadeAnimation(
                        1.5,
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue[450],
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(
                                  validator: (val) =>
                                      val.isEmpty ? "Enter an email" : null,
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.emailAddress,
                                  autofocus: false,
                                  decoration: textFieldDecoration.copyWith(
                                      hintText: "Email"),
                                  onChanged: (value) {
                                    setState(() {
                                      email = value;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                TextFormField(
                                  validator: (val) => val.length < 8
                                      ? "Password should be at least 8 characters long"
                                      : null,
                                  cursorColor: Colors.black,
                                  autofocus: false,
                                  decoration: textFieldDecoration.copyWith(
                                      hintText: "Password"),
                                  obscureText: true,
                                  onChanged: (value) {
                                    setState(() {
                                      password = value;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                TextFormField(
                                  validator: (val) =>
                                      val.isEmpty || val.length < 4
                                          ? "Please enter your name"
                                          : null,
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.text,
                                  autofocus: false,
                                  decoration: textFieldDecoration.copyWith(
                                      hintText: "Name"),
                                  onChanged: (value) {
                                    setState(() {
                                      name = value;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                TextFormField(
                                  validator: (val) =>
                                      val.isEmpty || val.length != 10
                                          ? "Please enter your phone number"
                                          : null,
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.phone,
                                  autofocus: false,
                                  decoration: textFieldDecoration.copyWith(
                                      hintText:
                                          "Phone Number"),
                                  onChanged: (value) {
                                    setState(() {
                                      phoneNumber = value;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                RaisedButton(
                                  color: primColor.shade800,
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      setState(() {
                                        loading = true;
                                      });
                                      dynamic result =
                                          await _auth.createFreshUser(
                                              email: email,
                                              password: password,
                                              name: name,
                                              phoneNumber: phoneNumber,
                                              numberOfPickups: 0);
                                      if (result != null) {
                                        setState(() {
                                          error =
                                              "Please provide valid credentials";
                                          loading = false;
                                        });
                                      } else {}
                                    }
                                  },
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  error,
                                  style: TextStyle(color: Colors.red),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Already have an account?",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    FlatButton.icon(
                                        onPressed: () {
                                          widget.toggleView();
                                        },
                                        icon: Icon(Icons.vpn_key),
                                        label: Text(
                                          "Login",
                                          style: TextStyle(fontSize: 20),
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          );
  }
}
