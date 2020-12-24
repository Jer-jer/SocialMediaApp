import 'package:flutter/material.dart';

class Text2 extends StatelessWidget {
  String hintText;
  num x;

  Text2(this.hintText, this.x);
  @override
  Widget build(BuildContext context) {
    return Text(
      hintText,
      style: TextStyle(
        fontSize: x,
      ),
    );
  }
}
