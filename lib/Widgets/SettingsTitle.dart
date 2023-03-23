import 'package:calori_fit/styles/Colors.dart';
import 'package:flutter/material.dart';

class SettingsTitle extends StatelessWidget {
  const SettingsTitle({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row( 
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: grey
            ),
            child: const Icon(Icons.keyboard_arrow_left_outlined, size: 25,),
          ),
        ),
        Flexible(child: Container()),
        Center(
          child: Text(text, style: const TextStyle(fontSize: 27, fontWeight: FontWeight.w900),),
        ),
        Flexible(child: Container()),
      ],
      );
  }
}