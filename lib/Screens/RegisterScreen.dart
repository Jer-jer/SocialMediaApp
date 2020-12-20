import 'package:FinalsProject/UI/CustomButton.dart';
import 'package:FinalsProject/UI/CustomInputfield.dart';
import 'package:FinalsProject/UI/CustomPadding.dart';
import 'package:FinalsProject/UI/LabelText.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.lightBlue[300],
            child: Center(
              child: Container(
                width: 400,
                height: 700,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'images/logo.png',
                      width: 150,
                      height: 150,
                    ),
                    LabelText(
                        'WE WELCOME YOU', 20.0, 'RockSalt', Alignment.center),
                    CustomPadding(7.0),
                    LabelText('Full Name', 17.0, '', Alignment.centerLeft),
                    CustomPadding(3.0),
                    CustomInputfield(),
                    CustomPadding(5.0),
                    LabelText('Email Address', 17.0, '', Alignment.centerLeft),
                    CustomPadding(3.0),
                    CustomInputfield(),
                    CustomPadding(5.0),
                    LabelText('Password', 17.0, '', Alignment.centerLeft),
                    CustomPadding(3.0),
                    CustomInputfield(),
                    CustomPadding(5.0),
                    LabelText('Mobile Number', 17.0, '', Alignment.centerLeft),
                    CustomPadding(8.0),
                    CustomInputfield(),
                    CustomButton('Register', 25.0, 'RockSalt',
                        Alignment.centerRight, '/registered'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
