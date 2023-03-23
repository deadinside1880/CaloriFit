import 'package:calori_fit/styles/Colors.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key});

  @override
  State<CustomSwitch> createState() => _SwitchState();
}

class _SwitchState extends State<CustomSwitch> {

  bool isActive = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        isActive = !isActive;
      }),
      //onHorizontalDragEnd:  ,
      child: Stack(
        children: [
          Container(
            height: 20,
            width: 40,
            decoration: BoxDecoration(
              color: isActive? const Color(0xFF69EBD0) : lightgrey,
              borderRadius: BorderRadius.circular(10)
            ),
          ),
          Positioned(
            left: isActive? 20: 2,
            top: 1,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                color: isActive? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(9)
              ),
            ),
          )
        ],
      ),
    );
  }
}