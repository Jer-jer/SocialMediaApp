import 'package:FinalsProject/UI/CustomPadding.dart';
import 'package:FinalsProject/UI/LabelText.dart';
import 'package:FinalsProject/UI/CustomButton.dart';
import 'package:flutter/material.dart';

class RegisteredScreen extends StatefulWidget {
  @override
  _RegisteredScreenState createState() => _RegisteredScreenState();
}

class _RegisteredScreenState extends State<RegisteredScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.lightBlue[300],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LabelText('YOU ARE NOW REGISTERED!', 18.0, 'RockSalt',
                  Alignment.center),
              CustomPadding(5.0),
              CustomButton('Click Here to Continue', 15.0, '',
                  Alignment.bottomRight, '/', Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
