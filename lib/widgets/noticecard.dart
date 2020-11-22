import 'package:flutter/material.dart';

class NoticeCard extends StatelessWidget {
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
            subtitle: Text("12:42 PM"),
          ),
          ListTile(
            leading: Icon(Icons.message_outlined),
            title:Text("Lorem Ipsum is simply specimen book.\n It has survived not only five centuries" , overflow: TextOverflow.fade ,)
          ),
          ListTile(
            leading: Icon(Icons.person_outline_rounded),
            title:Text("Published by CSED" , overflow: TextOverflow.fade ,)
          )
        ],
      ),
    );
  }
}
