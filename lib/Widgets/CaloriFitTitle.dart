import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class CaloriFitTitle extends StatelessWidget {
  const CaloriFitTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
                            "CaloriFit",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                             );
  }
}