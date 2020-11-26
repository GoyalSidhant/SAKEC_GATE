import 'package:SAKEC_GATE/screens/aboutus.dart';
import 'package:SAKEC_GATE/screens/login_option.dart';
import 'package:flutter/material.dart';
import 'package:SAKEC_GATE/global.dart' as global;

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              children: [
                CircleAvatar(
                    radius: 40,
                    child: Text(
                      "SA",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    )),
                SizedBox(height: 10),
                Text(
                  "Hello " + global.name + " !",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('About Company',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutUs()),
              );
            },
            leading: Icon(Icons.info, color: Colors.blue),
          ),
          ListTile(
            title: Text('Logout',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
            onTap: () async {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginOption()));
            },
            leading: Icon(Icons.exit_to_app, color: Colors.blue),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
