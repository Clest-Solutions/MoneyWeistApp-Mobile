import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_weist_demo/models/user.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});
  // collection reference
  final CollectionReference users = Firestore.instance.collection('userPersonalInfo');

  //updates user's personal info, that is only name and phone number
  Future updateUserInfo({String name, String phoneNumber, String dateOfBirth, int points, double totalWasteDealt,
  String referralCode,Map<String,String> userLocations})  async{
    return await users.document(uid).setData({
      "name" : name,
      "phoneNumber" : phoneNumber,
      "DOB" : dateOfBirth,
      "points" : points,
      "totalWaste" : totalWasteDealt,
      "referralCode" : referralCode,
      "userLocations" : userLocations
    });
  }

  //user data from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      name: snapshot.data["name"],
      dateOfBirth: snapshot.data["dateOfBirth"],
      totalWasteDealt: snapshot.data["totalWaste"],
      referralCode: snapshot.data["referralCode"],
      points: snapshot.data["points"],
      phoneNumber: snapshot.data["phoneNumber"],
      userLocations: snapshot.data["userLocations"]
    );
  }

  // stream for getting user document
  Stream<UserData> get userData{
    return users.document(uid).snapshots().map(_userDataFromSnapshot);
  }

}