import 'package:FinalsProject/Screens/Authenticate.dart';
import 'package:FinalsProject/Screens/DashboardScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:FinalsProject/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TheUser>(context);

    //returns Home or Authenticate Widget
    if (user == null) {
      return Authenticate();
    } else {
      return DashboardScreen();
    }
  }
}
