import 'package:flutter/material.dart';
import 'package:money_weist_demo/models/user.dart';
import 'package:money_weist_demo/services/auth.dart';
import 'package:money_weist_demo/services/database.dart';
import 'package:money_weist_demo/shared/constants.dart';
import 'package:money_weist_demo/shared/loading.dart';
import 'package:provider/provider.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(!snapshot.hasData){
          return Loading();
        }else{
          UserData _userData = snapshot.data;
          return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "MONEY WEIST",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {},
              icon: Icon(Icons.person, color: Colors.black),
              label: Text(
                "LogOut",
              ))
        ],
      ),
      body: ListView(
        children: <Widget>[
          _top(_userData.name,_userData.referralCode,_userData.points,_userData.totalWasteDealt),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 16, 16, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Actions",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                ),
              ],
            ),
          ),
          Container(
              child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,10,0,16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(child: _gridItem(Icons.airport_shuttle, "Request Pick-up")),
                      Expanded(child: _gridItem(Icons.sync, "Convert Points")),
                      Expanded(child: _gridItem(Icons.person_add, "Referrals")),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,16,0,16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                     Expanded(child:  _gridItem(Icons.library_books, "Edit Info")),
                      Expanded(child: _gridItem(Icons.add_location, "My Locations")),
                     Expanded(child:  _gridItem(Icons.perm_device_information, "About Money Weist")),
                    ],
                  ),
                ),
              ],
            ),
          )),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Text(
                  "Recent Actions",
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          _cardItem( "1"),
          _cardItem("2"),
          _cardItem("3"),
          _cardItem( "4"),
        ],
      ),
    );
        } 
      }
    );
  }


   _cardItem(number) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Date: $number/05/2020",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Pick-up By: Driver Ali",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "weight: 10Kg",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }

//  GridView(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3, childAspectRatio: 3 / 2),
//               children: <Widget>[
//                 _gridItem(Icons.airport_shuttle, "Request Pick-up"),
//                 _gridItem(Icons.sync, "Convert Points"),
//                 _gridItem(Icons.person_add, "Referrals"),
//                 _gridItem(Icons.library_books, "Edit Info"),
//                 _gridItem(Icons.add_location, "My Locations"),
//                 _gridItem(Icons.perm_device_information, "About Money Weist"),
//               ],
//             ),

  _gridItem(icon, action) {
    return Column(
      children: <Widget>[
        FloatingActionButton(
          onPressed: () {
          },
          child: Icon(icon),
          backgroundColor: Colors.blue[800].withOpacity(.9),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "$action",
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  _top(username, refCode, points,wasteDealt) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10.0,
            spreadRadius: 10.0,
            offset: Offset.fromDirection(0.3),
          )
        ],
        gradient: LinearGradient(colors: [Colors.blue[200], Colors.blue[400]]),
        color: Colors.greenAccent,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/user_image.png"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "$username",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {},
                color: Colors.white,
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            width: MediaQuery.of(context).size.width,
            height: 250,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10.0,
                    spreadRadius: 10.0,
                    offset: Offset.fromDirection(0.3),
                  )
                ],
                borderRadius: BorderRadius.circular(16.0),
                gradient: LinearGradient(colors: [
                  Colors.blue[800],
                  Colors.blue[600],
                  Colors.blue[300]
                ])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Current Points",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "$points",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Referral Code",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "$refCode",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Total Waste Dealt(Kg)",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "$wasteDealt",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}