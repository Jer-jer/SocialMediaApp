import 'package:FinalsProject/Screens/LoginScreen.dart';
import 'package:FinalsProject/Screens/RegisterScreen.dart';
import 'package:flutter/material.dart';

class RouteGenarator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterScreen());
//      case '/dashboard':
//        return MaterialPageRoute(builder: (_) => DashboardScreen());
//      case '/settings':
//        return MaterialPageRoute(builder: (_) => SettingsScreen());
    }
  }
}
