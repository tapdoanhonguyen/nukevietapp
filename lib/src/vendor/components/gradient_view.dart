import 'package:flutter/material.dart';
import 'package:nukeviet/src/vendor/commons/constants.dart';

class GradientView extends StatelessWidget {
  final Widget child;
  const GradientView({this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: AppConstant.gradientColor,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        child,
      ],
    );
  }
}