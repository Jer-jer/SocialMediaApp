import 'package:FinalsProject/Screens/DashboardScreen.dart';
import 'package:flutter/material.dart';
import 'LoginScreen.dart';
import 'package:FinalsProject/Screens/LoginScreen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //returns Home or Authenticate Widget
    return LoginScreen();
  }
}
