import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String hintText2;
  num size;
  String family;
  Alignment align;
  Color color;
  String route;
  CustomButton(this.hintText2, this.size, this.family, this.align, this.route,
      this.color);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Align(
      alignment: align,
      child: FlatButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, route);
        },
        child: Text(
          hintText2,
          style: TextStyle(
            fontSize: size,
            color: color,
            fontFamily: family,
          ),
        ),
      ),
    ));
  }
}
