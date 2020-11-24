import 'package:cloud_firestore/cloud_firestore.dart';

class Notice{
  String title ;
  String content ; 
  String undersigning ; 
  Timestamp timestamp ;
  String noticeID;

  Notice({
    this.content,
    this.title,
    this.timestamp,
    this.undersigning
  }) ; 

  factory Notice.fromDocument(DocumentSnapshot doc){
    return Notice(
      title : doc['title'],
      content : doc['content'],
      undersigning : doc['undersigning'],
      timestamp : doc['timestamp'],
    );
  }
}