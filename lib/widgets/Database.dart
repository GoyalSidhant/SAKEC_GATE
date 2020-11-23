import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  // Collection reference
  final CollectionReference securityCollection =
      Firestore.instance.collection('security');
  final CollectionReference staffCollection =
      Firestore.instance.collection('staff');
 

  // update userdata
  Future updateUserData(String fullName, String email, String password,
      String MobileNumber) async {
    return await securityCollection.document(uid).setData({
      'fullName': fullName,
      'email': email,
      'password': password,
      'MobileNumber': MobileNumber,
      'JoinDate': getCurrentDate(),
    });
  }

  Future updateData(String fullName, String email, String password,
      String MobileNumber) async {
    return await staffCollection.document(uid).setData({
      'fullName': fullName,
      'email': email,
      'password': password,
      'MobileNumber': MobileNumber,
      'JoinDate': getCurrentDate(),
    });
  }
}

String getCurrentDate() {
  var date = new DateTime.now().toString();

  var dateParse = DateTime.parse(date);

  var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";

  return formattedDate.toString();
}
