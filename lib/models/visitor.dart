import 'package:cloud_firestore/cloud_firestore.dart';

class Visitor{
  String name ; 
  String phone ; 
  String purpose ; 
  String staff ; 
  String mediaURL ; 
  Timestamp timestamp ;
  String visitorID ; 
  String staffMobile ; 
  

  Visitor({
    this.mediaURL,
    this.name,
    this.phone,
    this.purpose,
    this.staff,
    this.timestamp,
    this.visitorID,
    this.staffMobile
  });

  factory Visitor.fromDocument(DocumentSnapshot doc){
    return Visitor(
      name : doc['name'],
      phone : doc['phone'],
      purpose : doc['purpose'],
      staff : doc['staff'] , 
      timestamp : doc['timestamp'],
      mediaURL: doc['mediaURL'],
      visitorID:doc['visitorID'],
      staffMobile: doc['staffMobile']
    );
  }
}