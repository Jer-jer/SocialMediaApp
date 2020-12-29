import 'package:FinalsProject/services/auth.dart';
import 'package:FinalsProject/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:FinalsProject/services/database.dart';

class DrawerScreen extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final person = Provider.of<TheUser>(context);
    return Drawer(
      child: StreamBuilder<UserData>(
        stream: Database(uid: person.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            print(userData.address);
            print(userData.fullname);
            print(userData.age);
            return Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  color: Color(4283411658),
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
                          userData.fullname ?? 'There is no name',
                          style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'Thasadith',
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          userData.email ?? 'There is no email',
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
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text(
                    'Log Out',
                    style: TextStyle(
                      fontFamily: 'Thasadith',
                      fontSize: 18.0,
                    ),
                  ),
                  onTap: () {
                    dynamic result = _auth.signOut();
                    if (result != null) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/', (_) => false);
                    } else {
                      print("something is wrong");
                    }
                  },
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
