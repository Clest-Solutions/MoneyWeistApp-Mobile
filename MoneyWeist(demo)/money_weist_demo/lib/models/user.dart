class User{
  
  final String uid;
  User({this.uid});
}

class UserData{

  final String name; 
  final String phoneNumber;
  final String dateOfBirth;
  final int points; 
  final double totalWasteDealt;
  final String referralCode;
  final Map<String,String> userLocations;

  UserData({this.name, this.phoneNumber, this.dateOfBirth, this.points, this.totalWasteDealt, this.referralCode, this.userLocations});

}