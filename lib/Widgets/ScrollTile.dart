import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ScrollTile extends StatelessWidget {
  const ScrollTile({super.key, required this.number});
  final int number;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          number.toString(),
          style: const TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w500),
          ),
      ),
    );
  }
}