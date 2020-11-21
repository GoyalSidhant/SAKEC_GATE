import 'package:flutter/material.dart';

import 'login_option.dart';

class StartupScreen extends StatefulWidget {
  @override
  _StartupScreenState createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
  void autoLogin() {
    int login = 0;
    if (login == 1) {
      Future.delayed(Duration.zero, () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginOption()),
            (Route<dynamic> route) => false);
      });
    } else {
      Future.delayed(Duration.zero, () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginOption()),
            (Route<dynamic> route) => false);
      });
    }
  }

  //MobileVerfication

  @override
  void initState() {
    super.initState();
    autoLogin();
  }

  @override
  Widget build(BuildContext context) {
    //startup screen to load user info and state

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Color(0xff52caf4), Color(0xff3080ed)])),
        child: Column(
          children: [
            Center(
              child: Image.asset('assets/logo.png' , height: 300, width: 300,),
            ),
            Text("SAKEC GATE")
          ],
        ),
      ),
    );
  }
}
