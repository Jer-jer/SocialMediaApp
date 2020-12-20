import 'package:flutter/material.dart';

class CustomPadding extends StatelessWidget {
  num x;
  CustomPadding(this.x);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(x),
    );
  }
}
