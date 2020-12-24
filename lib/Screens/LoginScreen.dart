import 'package:FinalsProject/UI/CustomButton.dart';
import 'package:FinalsProject/UI/CustomInputfield.dart';
import 'package:FinalsProject/UI/CustomPadding.dart';
import 'package:FinalsProject/UI/LabelText.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color(4283411658),
            child: Center(
              child: Container(
                width: 400,
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'images/logo.png',
                      width: 150,
                      height: 150,
                    ),
                    LabelText('BAZ', 40.0, 'RockSalt', Alignment.center),
                    CustomPadding(7.0),
                    LabelText('Email/Username/PhoneNumber', 17.0, '',
                        Alignment.centerLeft),
                    CustomPadding(5.0),
                    CustomInputfield(),
                    CustomPadding(10.0),
                    LabelText('Password', 17.0, '', Alignment.centerLeft),
                    CustomPadding(5.0),
                    CustomInputfield(),
                    Row(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(left: 10.0)),
                        CustomButton('Not yet a member?', 15.0, '',
                            Alignment.centerLeft, '/register'),
                        Padding(padding: EdgeInsets.only(left: 100.0)),
                        CustomButton('Login', 25.0, 'RockSalt',
                            Alignment.centerRight, '/dashboard'),
                      ],
                    ),
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
