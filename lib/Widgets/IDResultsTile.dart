import 'package:calori_fit/styles/Colors.dart';
import 'package:flutter/material.dart';

class IDResultsTile extends StatelessWidget {
  const IDResultsTile({
    super.key, 
    required this.meal, 
    required this.isLastOption,
    required this.cals,
  });

  final String meal;
  final isLastOption;
  final int cals;

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
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Text(meal, style: const TextStyle(fontSize: 18),),
            Flexible(child: Container()),
            Text("$cals cal/serving", style: const TextStyle(fontSize: 18),)
          ],
        ),
      ),
    );
  }
}