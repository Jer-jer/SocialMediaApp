import 'package:FinalsProject/Screens/wrapper.dart';
import 'package:FinalsProject/Screens/LoginScreen.dart';
import 'package:FinalsProject/Screens/RegisterScreen.dart';
import 'package:FinalsProject/Screens/RegisteredScreen.dart';
import 'package:FinalsProject/Screens/DashboardScreen.dart';
import 'package:FinalsProject/Screens/AboutScreen.dart';
import 'package:FinalsProject/Screens/AccountScreen.dart';
import 'package:FinalsProject/route_Generator.dart';
import 'package:FinalsProject/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<TheUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Wrapper(),
          '/registered': (context) => RegisteredScreen(),
          '/dashboard': (context) => DashboardScreen(),
          '/account': (context) => AccountScreen(),
          '/aboutus': (context) => AboutScreen(),
          '/register': (context) => RegisterScreen(),
        },
      ),
    );
  }
}
