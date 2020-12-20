import 'package:FinalsProject/route_Generator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    onGenerateRoute: RouteGenarator.generateRoute,
  ));
}
