import 'package:flutter/material.dart';
import 'package:SAKEC_GATE/global.dart' as global;
class Vistors extends StatefulWidget {
  @override
  _VistorsState createState() => _VistorsState();
}

class _VistorsState extends State<Vistors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: global.role == "Security"
          ? FloatingActionButton(child: new Icon(Icons.add), onPressed: null)
          : SizedBox(),
      appBar: AppBar(
        title: Text("vistors"),
      ),
      
    );
  }
}