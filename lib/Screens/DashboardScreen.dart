import 'package:flutter/material.dart';
import './DrawerScreen.dart';
import 'package:FinalsProject/services/database.dart';
import 'package:provider/provider.dart';
import 'package:FinalsProject/Screens/posts.dart';
import 'package:FinalsProject/models/post.dart';
import 'package:FinalsProject/models/user.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Post>>.value(
      value: Database().postsSnap,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              'HOME',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'RockSalt',
              ),
            ),
            backgroundColor: Color(4283411658),
            elevation: 0.0,
          ),
          endDrawer: DrawerScreen(),
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Posts(),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              createAlertDialog(context);
            },
            label: Icon(Icons.add),
            backgroundColor: Color(4283411658),
          ),
        ),
      ),
    );
  }

  Future<String> createAlertDialog(BuildContext context) {
    final user = Provider.of<TheUser>(context, listen: false);
    final Database _post = Database();
    String content = "";

    return showDialog(
      context: context,
      builder: (context) {
        return StreamBuilder<Object>(
            stream: Database(uid: user.uid).userData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                UserData userData = snapshot.data;
                return AlertDialog(
                  titlePadding: EdgeInsets.all(10.0),
                  title: Text('Create Post'),
                  content: TextFormField(
                    onChanged: (val) {
                      setState(() => content = val);
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.lightBlue[300],
                      filled: true,
                    ),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  actions: <Widget>[
                    MaterialButton(
                      onPressed: () {
                        if (content.length > 1) {
                          bool result = _post.posting(content, userData.uid);
                          if (result == true) {
                            print("posted");
                            Navigator.of(context).pop();
                          } else {
                            print("There's an error on posting");
                          }
                        } else {
                          print("Please don't give us the silent treatment");
                        }
                      },
                      elevation: 5.0,
                      child: Image.asset(
                        'images/enter(4FACCA).png',
                        width: 30.0,
                        height: 30.0,
                      ),
                    ),
                  ],
                );
              }
            });
      },
    );
  }
}
