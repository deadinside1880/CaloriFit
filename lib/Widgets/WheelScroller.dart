import 'package:flutter/material.dart';

import '../styles/Colors.dart';
import 'ScrollTile.dart';

class WheelScroller extends StatefulWidget {
  final Function setValue;
  final int minimum;
  final int maximum;
  final double lineWidth;
  final String text;
  final int step;

  const WheelScroller(
      {super.key,
      required this.setValue,
      required this.minimum,
      required this.maximum,
      required this.lineWidth,
      required this.text,
      this.step = 1});

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
            padding: const EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.bottomRight,
            height: 90,
            width: widget.lineWidth,
            // width: widget.lineWidth,
            decoration: const BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(color: maingreen, width: 3))),
            child: Text(widget.text),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 3,
          child: ListWheelScrollView.useDelegate(
            overAndUnderCenterOpacity: 0.65,
            magnification: 1.5,
            useMagnifier: true,
            onSelectedItemChanged: (value) => widget.setValue(value),
            perspective: 0.001,
            physics: const FixedExtentScrollPhysics(),
            // diameterRatio: ,
            itemExtent: 70,
            childDelegate: ListWheelChildBuilderDelegate(
                childCount:
                    ((widget.maximum - widget.minimum) / widget.step + 1)
                        .toInt(),
                builder: (context, index) {
                  return ScrollTile(
                      number: (index * widget.step) + widget.minimum);
                }),
          ),
        ),
      ],
    );
  }
}
