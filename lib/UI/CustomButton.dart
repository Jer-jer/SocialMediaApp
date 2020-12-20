import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String hintText2;
  num size;
  String family;
  Alignment align;
  String route;
  CustomButton(this.hintText2, this.size, this.family, this.align, this.route);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Align(
      alignment: align,
      child: FlatButton(
        onPressed: () {
          Navigator.of(context).pushNamed(route);
        },
        child: Text(
          hintText2,
          style: TextStyle(
            fontSize: size,
            color: Colors.white,
            fontFamily: family,
          ),
        ),
      ),
    ));
  }
}
