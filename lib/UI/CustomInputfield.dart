import 'package:flutter/material.dart';

class CustomInputfield extends StatelessWidget {
  CustomInputfield();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 40,
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Colors.white,
        child: TextField(
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
