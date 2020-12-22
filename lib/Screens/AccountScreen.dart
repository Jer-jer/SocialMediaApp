import 'package:FinalsProject/UI/CustomButton.dart';
import 'package:FinalsProject/UI/CustomPadding.dart';
import 'package:FinalsProject/UI/Text2.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pushNamed('/dashboard');
            },
          ),
          title: Text(
            'ACCOUNT SETTINGS',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'RockSalt',
            ),
          ),
          backgroundColor: Colors.lightBlue[300],
          elevation: 0.0,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Container(
              height: 400,
              child: Column(
                children: <Widget>[
                  Text2('Full Name', 30.0),
                  CustomPadding(5.0),
                  Text2('Get Data From Database', 20.0),
                  CustomPadding(10.0),
                  Text2('Password', 30.0),
                  CustomPadding(5.0),
                  Text2('Get Data From Database', 20.0),
                  CustomPadding(10.0),
                  Text2('Email Address', 30.0),
                  CustomPadding(5.0),
                  Text2('Get Data From Database', 20.0),
                  CustomPadding(20.0),
                  CustomButton('Edit', 30.0, 'Thasadith',
                      Alignment.bottomCenter, '', Colors.blue),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
