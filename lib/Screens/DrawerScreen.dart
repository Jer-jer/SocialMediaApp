import 'package:FinalsProject/services/auth.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.lightBlue[300],
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 30, bottom: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: ExactAssetImage('images/klee.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Text(
                    'UserName/Fullname',
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Thasadith',
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Email@gmail.com',
                    style: TextStyle(
                      fontFamily: 'Thasadith',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text(
              'Account Settings',
              style: TextStyle(
                fontFamily: 'Thasadith',
                fontSize: 18.0,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed('/account');
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text(
              'About Us',
              style: TextStyle(
                fontFamily: 'Thasadith',
                fontSize: 18.0,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed('/aboutus');
            },
          ),
          // TextButton.icon(
          //   icon: Icon(Icons.logout),
          //   label: Text("Log Out"),
          //   style: TextButton.styleFrom(
          //     primary: Colors.grey,
          //     textStyle: TextStyle(
          //       color: Colors.grey,
          //       fontFamily: 'Thasadith',
          //       fontSize: 18.0,
          //     ),
          //   ),
          //   onPressed: () async {},
          // ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'Log Out',
              style: TextStyle(
                fontFamily: 'Thasadith',
                fontSize: 18.0,
              ),
            ),
            onTap: () async {
              await _auth.signOut();
              // Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
            },
          ),
        ],
      ),
    );
  }
}
