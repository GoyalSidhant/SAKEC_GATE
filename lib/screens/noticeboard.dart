import 'package:SAKEC_GATE/screens/createNotice.dart';
import 'package:SAKEC_GATE/widgets/noticecard.dart';
import 'package:flutter/material.dart';
import 'package:SAKEC_GATE/global.dart' as global;

class NoticeBoard extends StatefulWidget {
  @override
  _NoticeBoardState createState() => _NoticeBoardState();
}

class _NoticeBoardState extends State<NoticeBoard> {
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
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
        
        children: [
          NoticeCard(),
          NoticeCard(),
          NoticeCard(),
          NoticeCard(),
           

        ],
      ),
    );
  }
}
