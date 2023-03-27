import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class CaloriFitSmallTitle extends StatelessWidget {
  final Color color;
  const CaloriFitSmallTitle({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
                            "CaloriFit",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color),
                             );
  }
}