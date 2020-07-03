import 'package:flutter/material.dart';
import 'package:login_ui_sample/login_page.dart';
import 'package:login_ui_sample/login_widgets.dart';
import 'package:page_transition/page_transition.dart';

import 'Animations/FadeAnimation.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  AnimationController _scaleController;
  AnimationController _scale2Controller;
  AnimationController _widthController;
  AnimationController _positionController;

  Animation _scaleAnimation;
  Animation _scale2Animation;
  Animation _widthAnimation;
  Animation _positionAnimation;

  bool hideIcon = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scaleController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.8).animate(_scaleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _widthController.forward();
            }
          });

    _widthController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));

    _widthAnimation =
        Tween<double>(begin: 80.0, end: 300.0).animate(_widthController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _positionController.forward();
            }
          });

    _positionController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));

    _positionAnimation =
        Tween<double>(begin: 0.0, end: 215.0).animate(_positionController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                hideIcon = true;
              });
              _scale2Controller.forward();
            }
          });
    ;

    _scale2Controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    _scale2Animation =
        Tween<double>(begin: 1.0, end: 38.0).animate(_scale2Controller)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: LoginPage()));
            }
          });
    ;
  }

  @override
  Widget build(BuildContext context) {
    final double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 9, 23, 1),
      body: Container(
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -50,
              left: 0,
              child: FadeAnimation(
                  1,
                  Container(
                    width: screenwidth,
                    height: 400,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/images/one.png"),
                      fit: BoxFit.cover,
                    )),
                  )),
            ),
            Positioned(
              top: -100,
              left: 0,
              child: FadeAnimation(
                  1.3,
                  Container(
                    width: screenwidth,
                    height: 400,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/images/one.png"),
                      fit: BoxFit.cover,
                    )),
                  )),
            ),
            Positioned(
              top: -150,
              left: 0,
              child: FadeAnimation(
                  1.6,
                  Container(
                    width: screenwidth,
                    height: 400,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/images/one.png"),
                      fit: BoxFit.cover,
                    )),
                  )),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                      1,
                      Text(
                        "Welcome To Money Weist",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  FadeAnimation(
                      1.3,
                      Text(
                        "Our aim is to keep your waste cleared \nat your own convinient time\nFast response and clean work, our priority",
                        style: TextStyle(
                          color: Colors.white.withOpacity(.7),
                          height: 1.4,
                        ),
                      )),
                  SizedBox(
                    height: 180,
                  ),
                  FadeAnimation(
                      1.6,
                      AnimatedBuilder(
                        animation: _scaleController,
                        builder: (context, child) => Transform.scale(
                            scale: _scaleAnimation.value,
                            child: Center(
                              child: AnimatedBuilder(
                                animation: _widthController,
                                builder: (context, child) => Container(
                                  width: _widthAnimation.value,
                                  height: 80,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(50),
                                    color: Colors.blue.withOpacity(.4),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      _scaleController.forward();
                                    },
                                    child: Stack(children: <Widget>[
                                      AnimatedBuilder(
                                        animation: _positionController,
                                        builder: (context, child) => Positioned(
                                          left: _positionAnimation.value,
                                          child: AnimatedBuilder(
                                            animation: _scale2Controller,
                                            builder: (context, child) => Transform.scale(
                                              scale: _scale2Animation.value,
                                            child: Container(
                                              width: 60,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.blue[800],
                                              ),
                                              child: hideIcon == false ? Icon(
                                                Icons.arrow_forward,
                                                color: Colors.white,
                                              ) : Container(),
                                            )),
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                              ),
                            )),
                      )),
                  SizedBox(
                    height: 60,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
