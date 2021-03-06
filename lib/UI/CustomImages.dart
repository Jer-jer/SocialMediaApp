import 'package:flutter/material.dart';

class CustomImages extends StatelessWidget {
  String hintText3;
  String hintText4;

  CustomImages(this.hintText3, this.hintText4);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(left: 20)),
        Container(
          width: 75,
          height: 75,
          child: CircleAvatar(
            backgroundImage: AssetImage(hintText3),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            hintText4,
            style: TextStyle(
              fontFamily: 'Thasadith',
              fontSize: 15.0,
            ),
          ),
        ),
      ],
    );
  }
}
