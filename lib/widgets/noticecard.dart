import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NoticeCard extends StatefulWidget {
  final String content;
  final Timestamp time;

  final String title;

  final String undersigned;

  NoticeCard({this.content, this.title, this.time, this.undersigned});

  @override
  _NoticeCardState createState() => _NoticeCardState();
}

class _NoticeCardState extends State<NoticeCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.rss_feed),
            title: Text("Notice"),
            subtitle: Text(widget.time.toDate().toString()),
          ),
          ListTile(
              leading: Icon(Icons.message_outlined),
              title: Text(
                widget.title,
                overflow: TextOverflow.fade,
              )),
          ListTile(
              leading: Icon(Icons.person_outline_rounded),
              title: Text(
                widget.undersigned,
                overflow: TextOverflow.fade,
              ))
        ],
      ),
    );
  }
}
