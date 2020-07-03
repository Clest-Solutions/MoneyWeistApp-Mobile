import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver_app/models/driver.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});
  // collection reference
  final CollectionReference drivers = Firestore.instance.collection('drivers');

  //updates user's personal info, that is only name and phone number
  Future updateUserInfo({String name, String phoneNumber, String id, int numberOfPickups})  async{
    return await drivers.document(uid).setData({
      "name" : name,
      "phoneNumber" : phoneNumber,
      "id" : id,
      "numberOfPickups" : numberOfPickups
    });
  }

  //user data from snapshot
  DriverData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return DriverData(
      name: snapshot.data["name"],
      phoneNumber: snapshot.data["phoneNumber"],
      id: snapshot.data["id"],
      numberOfPickups: snapshot.data["numberOfPickups"]
    );
  }

  // stream for getting user document
  Stream<DriverData> get userData{
    return drivers.document(uid).snapshots().map(_userDataFromSnapshot);
  }

}