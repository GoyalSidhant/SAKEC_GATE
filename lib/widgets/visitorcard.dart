import 'package:flutter/material.dart';

class VistorCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Name"),
            //trailing: Text("12:42 PM"),
          ),
          ListTile(
            leading: Icon(Icons.meeting_room),
            title:Text("Proff" , overflow: TextOverflow.fade ,)
          ),
          ListTile(
            leading: Icon(Icons.lock_clock),
            title:Text("Status" , overflow: TextOverflow.fade ,)
          )
        ],
      ),
    );
  }
}
