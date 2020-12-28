import 'package:FinalsProject/Screens/LoginScreen.dart';
import 'package:FinalsProject/Screens/RegisterScreen.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}
