import 'package:calori_fit/styles/Colors.dart';
import 'package:flutter/material.dart';

class ProfileScreenOption extends StatelessWidget {
  const ProfileScreenOption({
    super.key, 
    required this.onPress, 
    required this.text, 
    required this.isLastOption
  });

  final VoidCallback onPress;
  final String text;
  final isLastOption;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.of(context).size.width*.8,
      decoration: BoxDecoration(
        border: Border(
          top: const BorderSide(
            width: 2,
            color: grey
          ),
          bottom: BorderSide(
            width: isLastOption? 2: 0,
            color: grey
          )
        )
      ),
      child: GestureDetector(
        onTap: onPress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Text(text, style: const TextStyle(fontSize: 18),),
            const Icon(Icons.keyboard_arrow_right_outlined, size: 35,)
          ],
        ),
      ),
    );
  }
}