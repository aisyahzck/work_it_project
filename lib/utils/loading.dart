import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[300],
      child: Center(
        child: SpinKitFoldingCube(
          color: Colors.pink,
          size: 60.0,
        ),
      ),
    );
  }
}