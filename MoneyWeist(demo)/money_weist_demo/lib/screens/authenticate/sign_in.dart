import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:money_weist_demo/Animations/FadeAnimation.dart';
import 'package:money_weist_demo/services/auth.dart';
import 'package:money_weist_demo/shared/constants.dart';
import 'package:money_weist_demo/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();

  //textfield state
  String email = "";
  String password = "";
  String error = "";

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: primColor.shade600,
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FadeAnimation(
                1.2,
                Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 30,
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
                          decoration: textFieldDecoration.copyWith(hintText: "Email"),
                          onChanged: (val) {
                            email = val;
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          validator: (val) => val.length < 8
                              ? "Password should be at least 8 characters long"
                              : null,
                          cursorColor: Colors.black,
                          autofocus: false,
                          decoration: textFieldDecoration.copyWith(hintText: "Password"),
                          obscureText: true,
                          onChanged: (val) {
                            password = val;
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        RaisedButton(
                          color: primColor.shade800,
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                loading = true;
                              });
                              dynamic result =
                                  await _auth.signInWithEmailAndPassword(
                                      email, password);
                              if (result == null) {
                                setState((){
                                    error = "Please provide valid credentials";
                                    loading = false;
                                    });
                              }
                            }
                          },
                          child: Text(
                            "Login",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
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
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "New to $companyName ?",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            FlatButton.icon(
                                onPressed: () {
                                  widget.toggleView();
                                },
                                icon: Icon(Icons.person),
                                label: Text(
                                  "Sign Up",
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
    );
  }
}
