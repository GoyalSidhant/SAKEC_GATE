import 'package:SAKEC_GATE/models/visitor.dart';
import 'package:SAKEC_GATE/screens/addVisitor.dart';
import 'package:SAKEC_GATE/screens/login_option.dart';
import 'package:SAKEC_GATE/widgets/drawer.dart';
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
   final CollectionReference visitorCollection = Firestore.instance.collection('visitors');
   List<Visitor> visitors = []; 
   getVisitor() async {
    QuerySnapshot snapshot = await visitorCollection.getDocuments();
    print(snapshot.documents[0].data.toString());
    setState(() {
      visitors =
          snapshot.documents.map((doc) => Visitor.fromDocument(doc)).toList();
    });
    print(visitors.toString());
  }

  @override
  void initState() {
    super.initState();
    getVisitor();
  }
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
      body: visitors.length > 0 ?  ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
          itemCount: visitors.length,
          itemBuilder: (context, index) {
            return VistorCard(
              name: visitors[index].name, 
              staff: visitors[index].staff,
              mediaurl: visitors[index].mediaURL,
              purpose: visitors[index].purpose,
            );
          }):
          Container(),
    );
  }
}
