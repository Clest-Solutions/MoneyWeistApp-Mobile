import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  static String tag = "main-page";
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
        tag: "hero",
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          backgroundImage: AssetImage("assets/djman.jpg"),
        ));

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "Welcome",
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final lorem = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose",
        style: TextStyle(color: Colors.white),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20.0, 260.0, 20.0, 10.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.blue, Colors.lightBlueAccent]),
      ),
      child:Column(
          children: <Widget>[
            logo,
            welcome,
            lorem,
          ],
        ),
    );

    return Scaffold(
      body: body,
    );
  }
}
