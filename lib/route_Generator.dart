import 'package:FinalsProject/Screens/wrapper.dart';
import 'package:FinalsProject/Screens/LoginScreen.dart';
import 'package:FinalsProject/Screens/RegisterScreen.dart';
import 'package:FinalsProject/Screens/RegisteredScreen.dart';
import 'package:FinalsProject/Screens/DashboardScreen.dart';
import 'package:FinalsProject/Screens/AboutScreen.dart';
import 'package:FinalsProject/Screens/AccountScreen.dart';
import 'package:flutter/material.dart';

class RouteGenarator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Wrapper());
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case '/registered':
        return MaterialPageRoute(builder: (_) => RegisteredScreen());
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => DashboardScreen());
      case '/account':
        return MaterialPageRoute(builder: (_) => AccountScreen());
      case '/aboutus':
        return MaterialPageRoute(builder: (_) => AboutScreen());
    }
  }
}
