import 'package:calori_fit/Widgets/HorizontalSlider.dart';
import 'package:calori_fit/Widgets/InfoSelectionBottom.dart';
import 'package:calori_fit/screens/heightscreen.dart';
import 'package:calori_fit/styles/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:horizontal_picker/horizontal_picker.dart';

import '../Widgets/CaloriFitTitle.dart';
import '../Widgets/CaloriFitTitleSmall.dart';

class WeightSelector extends StatefulWidget {
  const WeightSelector({super.key});

  @override
  State<WeightSelector> createState() => _WeightSelectorState();
}

class _WeightSelectorState extends State<WeightSelector> {
  int weight = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
          ),
          const CaloriFitSmallTitle(color: Colors.white),
          SizedBox(
            height: MediaQuery.of(context).size.height / 30,
          ),
          const Text(
            "WHAT'S YOUR WEIGHT?",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w900,
                fontFamily: 'IntegralCF'),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text("THIS HELPS US CREATE YOUR PERSONALIZED PLAN"),
          const SizedBox(
            height: 150,
          ),
          HorizontalSlider(
              minValue: 30,
              maxValue: 150,
              divisions: 120,
              height: 130,
              activeItemTextColor: maingreen,
              backgroundColor: backgroundcolor,
              onChanged: (value) {
                setState(() {
                  weight = value.toInt();
                });
              }),
          //  const SizedBox(height: 300,),
          Flexible(flex: 1, child: Container()),
          InfoSelectionBottom(
            Screen: "WEIGHTSCREEN",
            nextScreen: const HeightSelectorScreen(),
            weight: weight,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
          )
        ],
      ),
    );
  }
}
