import 'package:SAKEC_GATE/screens/startup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SAKEC GATE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff51a4da),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StartupScreen(),
      
    );
  }
}