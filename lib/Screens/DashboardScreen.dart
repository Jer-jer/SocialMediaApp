import 'package:FinalsProject/UI/CustomImages.dart';
import 'package:FinalsProject/UI/CustomPadding.dart';
import 'package:flutter/material.dart';
import './DrawerScreen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
          backgroundColor: Colors.lightBlue[300],
          elevation: 0.0,
        ),
        endDrawer: DrawerScreen(),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Container(
                child: Column(
                  children: <Widget>[
                    CustomPadding(20.0),
                    CustomImages('images/jean.jpg', 'Wala Nako Kasabot'),
                    CustomPadding(35.0),
                    CustomImages(
                        'images/paimon.jpeg', 'Klaro kaayo mo duwa Genshin ai'),
                    CustomPadding(35.0),
                    CustomImages('images/qiqi.jpg',
                        'Duwa palang kag valo, malipay pako'),
                    CustomPadding(35.0),
                    CustomImages('images/yaoya.png',
                        'Yawa ka snake snake ra gani ko ngari'),
                    CustomPadding(35.0),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            createAlertDialog(context);
          },
          icon: Icon(Icons.add),
          label: Text('Create'),
          backgroundColor: Colors.lightBlue[300],
        ),
      ),
    );
  }

  Future<String> createAlertDialog(BuildContext context) {
    TextEditingController customController = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            titlePadding: EdgeInsets.all(10.0),
            title: Text('Create Post'),
            content: TextField(
              controller: customController,
            ),
            actions: <Widget>[
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop(customController.text.toString());
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
        });
  }
}
