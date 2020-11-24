import 'package:SAKEC_GATE/models/visitor.dart';
import 'package:SAKEC_GATE/screens/addVisitor.dart';
import 'package:SAKEC_GATE/screens/login_option.dart';
import 'package:SAKEC_GATE/widgets/drawer.dart';
import 'package:SAKEC_GATE/widgets/secuirtyVistor.dart';
import 'package:SAKEC_GATE/widgets/visitorcard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:SAKEC_GATE/global.dart' as global;

import 'mobile_verification.dart';

class Vistors extends StatefulWidget {
  @override
  _VistorsState createState() => _VistorsState();
}

class _VistorsState extends State<Vistors> {
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: global.role == "Security"
          ? FloatingActionButton(
              child: new Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddVisitor()),
                );
              })
          : SizedBox(),
      appBar: AppBar(
        title: Text("Vistors"),
      ),
      drawer: CustomDrawer(),
      body: SecurityList()
    );
  }
}

