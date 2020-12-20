import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  String hintText;
  num y;
  String hi;
  Alignment align;
  LabelText(this.hintText, this.y, this.hi, this.align);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      child: Align(
        alignment: align,
        child: Text(
          hintText,
          style: TextStyle(
            fontSize: y,
            color: Colors.white,
            fontFamily: hi,
          ),
        ),
      ),
    );
  }
}
