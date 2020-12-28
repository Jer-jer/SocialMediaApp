import 'package:flutter/material.dart';
import './DrawerScreen.dart';
import 'package:FinalsProject/services/database.dart';
import 'package:provider/provider.dart';
import 'package:FinalsProject/Screens/posts.dart';
import 'package:FinalsProject/models/post.dart';

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
                child: Posts(
                    // Center(
                    //       child: Container(
                    //         child: Column(
                    //           children: <Widget>[
                    //             CustomPadding(20.0),
                    //             CustomImages('images/jean.jpg', 'Wala Nako Kasabot'),
                    //             CustomPadding(35.0),
                    //             CustomImages('images/paimon.jpeg',
                    //                 'Klaro kaayo mo duwa Genshin ai'),
                    //             CustomPadding(35.0),
                    //             CustomImages('images/qiqi.jpg',
                    //                 'Duwa palang kag valo, malipay pako'),
                    //             CustomPadding(35.0),
                    //             CustomImages('images/yaoya.png',
                    //                 'Yawa ka snake snake ra gani ko ngari'),
                    //             CustomPadding(35.0),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    ),
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
    final Database _post = Database();
    TextEditingController customController = TextEditingController();
    String content = "";

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          titlePadding: EdgeInsets.all(10.0),
          title: Text('Create Post'),
          content: TextFormField(
            controller: customController,
            onChanged: (val) {
              setState(() => content = val);
            },
          ),
          actions: <Widget>[
            MaterialButton(
              onPressed: () {
                if (content.length > 1) {
                  bool result = _post.posting(content);
                  if (result == true) {
                    print("posted");
                    Navigator.of(context).pop(customController.text.toString());
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
      },
    );
  }
}
