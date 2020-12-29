import 'package:FinalsProject/UI/CustomImages.dart';
import 'package:FinalsProject/UI/CustomPadding.dart';
import 'package:flutter/material.dart';
import 'package:FinalsProject/models/post.dart';

class PostTile extends StatelessWidget {
  final Post post;
  PostTile({this.post});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Column(
          children: <Widget>[
            CustomPadding(20.0),
            CustomImages('images/jean.jpg', post.content),
            CustomPadding(15.0),
          ],
        ),
      ),
    );
  }
}
