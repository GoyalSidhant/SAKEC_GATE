import 'package:SAKEC_GATE/models/visitor.dart';
import 'package:flutter/material.dart';

class VistorCard extends StatefulWidget {
  final String name;
  final String staff;
  final String mediaurl;
  final String purpose ; 
  VistorCard({this.name, this.staff, this.mediaurl , this.purpose});
  @override
  _VistorCardState createState() => _VistorCardState();
}

class _VistorCardState extends State<VistorCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          ListTile(
            leading: Container(
                  child: new Image.network( widget.mediaurl,
                    fit: BoxFit.cover,
                    loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
  if (loadingProgress == null) return child;
    return Center(
      child: CircularProgressIndicator(
      value: loadingProgress.expectedTotalBytes != null ? 
             loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
             : null,
      ),
    );
  },
                  ),
                ),
            title: Text(widget.name),
            //trailing: Text("12:42 PM"),
          ),
          ListTile(
              leading: Icon(Icons.meeting_room),
              title: Text(
                widget.staff,
                overflow: TextOverflow.fade,
              )),
          ListTile(
              leading: Icon(Icons.lock_clock),
              title: Text(
                widget.purpose,
                overflow: TextOverflow.fade,
              ))
        ],
      ),
    );
  }
}
