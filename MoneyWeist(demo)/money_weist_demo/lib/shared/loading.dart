import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:money_weist_demo/shared/constants.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primColor,
      child: Center(
        child: SpinKitWave(
          color: secColor.shade500,
          size: 50,
        ),
      ),
    );
  }
}