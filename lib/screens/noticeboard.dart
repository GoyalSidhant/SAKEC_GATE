import 'package:SAKEC_GATE/models/notice.dart';
import 'package:SAKEC_GATE/screens/createNotice.dart';
import 'package:SAKEC_GATE/widgets/drawer.dart';
import 'package:SAKEC_GATE/widgets/noticecard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:SAKEC_GATE/global.dart' as global;

class NoticeBoard extends StatefulWidget {
  @override
  _NoticeBoardState createState() => _NoticeBoardState();
}

class _NoticeBoardState extends State<NoticeBoard> {
  List<Notice> notices = [];
  final CollectionReference noticeCollection =
      Firestore.instance.collection('notice');

  getNotices() async {
    QuerySnapshot snapshot = await noticeCollection.getDocuments();
    print(snapshot.documents[0].data.toString());
    setState(() {
      notices =
          snapshot.documents.map((doc) => Notice.fromDocument(doc)).toList();
    });
    print(notices.toString());
  }

  @override
  void initState() {
    super.initState();
    getNotices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: global.role == "staff"
          ? FloatingActionButton(
              child: new Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateNotice()),
                );
              })
          : SizedBox(),
      appBar: AppBar(
        title: Text("Noticeboard"),
      ),
      drawer: CustomDrawer(),
      body: notices.length > 0 ?  ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
          itemCount: notices.length,
          itemBuilder: (context, index) {
            return NoticeCard(
              content: notices[index].content, 
              time: notices[index].timestamp,
              title: notices[index].title,
              undersigned: notices[index].undersigning,
            );
          }):
          Container(),
    );
  }
}
