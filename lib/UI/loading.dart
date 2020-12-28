import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext constext) {
    return SafeArea(
      child: Container(
        color: Colors.lightBlue[300],
        child: Center(
          child: SpinKitWanderingCubes(
            color: Colors.white,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}
