import 'package:SAKEC_GATE/models/visitor.dart';
import 'package:flutter/material.dart';
import 'package:SAKEC_GATE/global.dart' as global;
import 'package:url_launcher/url_launcher.dart';

class VistorCard extends StatefulWidget {
  final String name;
  final String staff;
  final String mediaurl;
  final String purpose;
  final String staffMobile;
  VistorCard(
      {this.name, this.staff, this.mediaurl, this.purpose, this.staffMobile});
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
              child: new Image.network(
                widget.mediaurl,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes
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
              )),
          IconButton(
              icon: global.role == "staff"
                  ? Icon(
                      Icons.check,
                      color: Colors.green,
                    )
                  : Icon(
                      Icons.phone,
                      color: Colors.red,
                    ),
              onPressed: global.role == "staff"
                  ? () {
                      showDialog(
                          context: context,
                          builder: (_) => new AlertDialog(
                                title: new Text("Acknowledgement"),
                                content: new Text("Met the Visitor"),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('ok'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              ));
                    }
                  : () async {
                      String url = "tel: " + widget.staffMobile;
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    })
        ],
      ),
    );
  }
}
