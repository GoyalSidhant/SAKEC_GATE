import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseService {

  final String uid;

  DatabaseService({
    this.uid
  });

  // Collection reference
  final CollectionReference securityCollection = Firestore.instance.collection(
      'security');
  final CollectionReference staffCollection = Firestore.instance.collection('staff');

  // final CollectionReference chatCollection = Firestore.instance.collection('chat');
  // final CollectionReference docsCollection = Firestore.instance.collection('Doc');
  // final CollectionReference postCollection = Firestore.instance.collection('posts');
  // final CollectionReference musixCollection = Firestore.instance.collection('music');
  // final CollectionReference DocCollection = Firestore.instance.collection('Doc');


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
//   sendSingleMessage(String groupId, chatMessageData) {
//     Firestore.instance.collection('chat').document(groupId).collection('messages').add(chatMessageData);
//     Firestore.instance.collection('chat').document(groupId).updateData({
//       'recentMessage': chatMessageData['message'],
//       'recentMessageSender': chatMessageData['sender'],
//       'recentMessageTime': chatMessageData['time'].toString(),
//     });
//   }
//
//   // create group
//   Future createGroup(String userName, String groupName) async {
//     DocumentReference groupDocRef = await groupCollection.add({
//       'groupName': groupName,
//       'groupIcon': '',
//       'admin': userName,
//       'members': [],
//       //'messages': ,
//       'groupId': '',
//       'recentMessage': '',
//       'recentMessageSender': ''
//     });
//
//     await groupDocRef.updateData({
//       'members': FieldValue.arrayUnion([uid + '_' + userName]),
//       'groupId': groupDocRef.documentID
//     });
//
//     DocumentReference userDocRef = userCollection.document(uid);
//     return await userDocRef.updateData({
//       'groups': FieldValue.arrayUnion([groupDocRef.documentID + '_' + groupName])
//     });
//   }
//   Future createSinglechat(String userName,String ID,String Docname) async {
//     DocumentReference groupDocRef = await chatCollection.add({
//       'members': [],
//       //'messages': ,
//       'singleId': '',
//       'recentMessage': '',
//       'recentMessageSender': ''
//     });
//
//     await groupDocRef.updateData({
//       'members': FieldValue.arrayUnion([uid + '_' + userName]),
//       'singleId': groupDocRef.documentID
//     });
//     await groupDocRef.updateData({
//       'members': FieldValue.arrayUnion([ID + '_' + Docname]),
//       'singleId': groupDocRef.documentID
//     });
//     DocumentReference DoctorRef=DocCollection.document(ID);
//     await DoctorRef.updateData({
//       'single':FieldValue.arrayUnion([groupDocRef.documentID + '_' + userName])
//     });
//
//     DocumentReference userDocRef = userCollection.document(uid);
//     return await userDocRef.updateData({
//       'single': FieldValue.arrayUnion([groupDocRef.documentID + '_' + Docname])
//     });
//   }
//   Future<QuerySnapshot> getDoc(){
//     return DocCollection.getDocuments();
//   }
//   Future<Stream<QuerySnapshot>> getDocGroups() async {
//     // return await Firestore.instance.collection("users").where('email', isEqualTo: email).snapshots();
//     return Firestore.instance.collection("Doc").snapshots();
//   }
//   getSingleChats(String groupId) async {
//     return Firestore.instance.collection('chat').document(groupId).collection('messages').orderBy('time').snapshots();
//   }
//
//
//
//
//   // toggling the user group join
//   Future togglingGroupJoin(String groupId, String groupName, String userName) async {
//
//     DocumentReference userDocRef = userCollection.document(uid);
//     DocumentSnapshot userDocSnapshot = await userDocRef.get();
//
//     DocumentReference groupDocRef = groupCollection.document(groupId);
//
//     List<dynamic> groups = await userDocSnapshot.data['groups'];
//
//     if(groups.contains(groupId + '_' + groupName)) {
//       //print('hey');
//       await userDocRef.updateData({
//         'groups': FieldValue.arrayRemove([groupId + '_' + groupName])
//       });
//
//       await groupDocRef.updateData({
//         'members': FieldValue.arrayRemove([uid + '_' + userName])
//       });
//     }
//     else {
//       //print('nay');
//       await userDocRef.updateData({
//         'groups': FieldValue.arrayUnion([groupId + '_' + groupName])
//       });
//
//       await groupDocRef.updateData({
//         'members': FieldValue.arrayUnion([uid + '_' + userName])
//       });
//     }
//   }
//
//
//   // has user joined the group
//   Future<bool> isUserJoined(String groupId, String groupName, String userName) async {
//
//     DocumentReference userDocRef = userCollection.document(uid);
//     DocumentSnapshot userDocSnapshot = await userDocRef.get();
//
//     List<dynamic> groups = await userDocSnapshot.data['groups'];
//
//
//     if(groups.contains(groupId + '_' + groupName)) {
//       //print('he');
//       return true;
//     }
//     else {
//       //print('ne');
//       return false;
//     }
//   }
//
//
//   // get user data
//   Future getUserData(String email) async {
//     QuerySnapshot snapshot = await userCollection.where('email', isEqualTo: email).getDocuments();
//     print(snapshot.documents[0].data);
//     return snapshot;
//   }
//   Future<QuerySnapshot> getGroups() async {
//     // return await Firestore.instance.collection("users").where('email', isEqualTo: email).snapshots();
//     return Firestore.instance.collection("groups").getDocuments();
//   }
//
//   // get user groups
//   getUserGroups() async {
//     // return await Firestore.instance.collection("users").where('email', isEqualTo: email).snapshots();
//     return Firestore.instance.collection("users").document(uid).snapshots();
//   }
//
//
//   // send message
//   sendMessage(String groupId, chatMessageData) {
//     Firestore.instance.collection('groups').document(groupId).collection('messages').add(chatMessageData);
//     Firestore.instance.collection('groups').document(groupId).updateData({
//       'recentMessage': chatMessageData['message'],
//       'recentMessageSender': chatMessageData['sender'],
//       'recentMessageTime': chatMessageData['time'].toString(),
//     });
//   }
//
//
//   // get chats of a particular group
//   getChats(String groupId) async {
//     return Firestore.instance.collection('groups').document(groupId).collection('messages').orderBy('time').snapshots();
//   }
//
//
//   // search groups
//   searchByName(String groupName) {
//     return Firestore.instance.collection("groups").where('groupName', isEqualTo: groupName).getDocuments();
//   }
//   Future<QuerySnapshot> searchByid(String groupId) async{
// //    print(groupId);
// //    print(Firestore.instance.collection("groups").document(groupId).documentID);
// //    await Firestore.instance.collection("groups").document(groupId).get().then((Document) => print(Document.data ));
// //    print(Firestore.instance.collection("groups").where('groupId', isEqualTo: groupId).getDocuments());
// //    var document = await Firestore.instance.collection('groups').document('groupId').get();
// //    print(document.data['groupName']);
//
//     //return Firestore.instance.collection("groups").where("groupId", isEqualTo: groupId).getDocuments();
//     return Firestore.instance.collection("groups").where('groupName', isEqualTo: groupId).getDocuments();
//   }
// }



String getCurrentDate(){

  var date = new DateTime.now().toString();

  var dateParse = DateTime.parse(date);

  var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";

  return formattedDate.toString();

}