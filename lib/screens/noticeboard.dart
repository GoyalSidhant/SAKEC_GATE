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
          ? FloatingActionButton(child: new Icon(Icons.add), onPressed: null)
          : SizedBox(),
      appBar: AppBar(
        title: Text("Noticeboard"),
      ),
    );
  }
}
