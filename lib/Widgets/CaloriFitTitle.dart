import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class CaloriFitTitle extends StatelessWidget {
  final Color color;
  const CaloriFitTitle({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      "CaloriFit",
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: color,
          fontFamily: 'IntegralCF',
          ),
    );
  }
}
