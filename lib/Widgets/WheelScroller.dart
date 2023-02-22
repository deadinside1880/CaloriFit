import 'package:flutter/material.dart';

import '../styles/Colors.dart';
import 'ScrollTile.dart';

class WheelScroller extends StatefulWidget {
  final Function setAge;
  const WheelScroller({super.key, required this.setAge});

  @override
  State<WheelScroller> createState() => _WheelScrollerState();
}

class _WheelScrollerState extends State<WheelScroller> {
  @override
  Widget build(BuildContext context) {
    return Stack(
              alignment: Alignment.center,
              children: [
                      Center(
                        child: Container(
                          height: 90,
                          width: 90,
                          decoration: const BoxDecoration(
                            border: Border.symmetric(horizontal: BorderSide(color: maingreen, width: 3))
                          ),
                        ),
                      ),
                    Container(
                      height: MediaQuery.of(context).size.height/3,
                      child: ListWheelScrollView.useDelegate(
                        overAndUnderCenterOpacity: 0.8,
                        magnification: 1.3,
                        useMagnifier: true,
                        onSelectedItemChanged:(value) => widget.setAge(value),
                        perspective: 0.005,
                        physics: const FixedExtentScrollPhysics(),
                        //diameterRatio: 1.2,
                        itemExtent: 70, 
                        childDelegate: ListWheelChildBuilderDelegate(
                          childCount: 56,
                          builder: (context, index) {
                            return ScrollTile(number: index+15);
                          }
                        ),
                      ),
                    ),
              ],
            );
  }
}