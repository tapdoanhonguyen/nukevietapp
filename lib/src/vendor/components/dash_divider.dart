import 'package:flutter/material.dart';

class DashDivider extends StatelessWidget {
  final double height;
  final Color color;
  final EdgeInsets padding;

  const DashDivider({
    this.height = 0.5,
    this.color,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = 4.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Container(
          child: Padding(
            padding: padding ?? EdgeInsets.fromLTRB(0, 3, 0, 4),
            child: Flex(
              children: List.generate(dashCount, (_) {
                return SizedBox(
                  width: dashWidth,
                  height: dashHeight,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: color ?? Colors.grey.withOpacity(0.3),
                    ),
                  ),
                );
              }),
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              direction: Axis.horizontal,
            ),
          ),
        );
      },
    );
  }
}
