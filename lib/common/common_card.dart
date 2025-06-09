import 'package:flutter/material.dart';

class CommonAppWidget extends StatelessWidget {
  final Color? bgColor;
  final double? height;
  final double? width;

  const CommonAppWidget({
    super.key,
    this.bgColor,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor ?? Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      height: height,
      width: width,
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [

        ],
      ),
    );
  }
}
