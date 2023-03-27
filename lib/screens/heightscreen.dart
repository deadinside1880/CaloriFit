import 'package:calori_fit/resources/providers.dart';
import 'package:calori_fit/screens/caloriescreen.dart';
import 'package:calori_fit/screens/loginscreen.dart';
import 'package:calori_fit/styles/Colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/CaloriFitTitle.dart';
import '../Widgets/CaloriFitTitleSmall.dart';
import '../Widgets/InfoSelectionBottom.dart';
import '../Widgets/WheelScroller.dart';

class HeightSelectorScreen extends StatefulWidget {
  const HeightSelectorScreen({super.key});

  @override
  State<HeightSelectorScreen> createState() => _HeightSelectorScreenState();
}

class _HeightSelectorScreenState extends State<HeightSelectorScreen> {
  int _height = 130;

  void updateHeight(int height) {
    setState(() {
      _height = height + 130;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: EdgeInsets.symmetric(
        //     horizontal: MediaQuery.of(context).size.width / 10),
        child: Column(
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
              "WHAT'S YOUR HEIGHT?",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'IntegralCF'),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text("THIS HELPS US CREATE"),
            const SizedBox(
              height: 5,
            ),
            const Text(" YOUR PERSONALIZED PLAN"),
            const SizedBox(
              height: 50,
            ),
            WheelScroller(
              setValue: (value) => updateHeight(value),
              minimum: 130,
              maximum: 200,
              lineWidth: 150,
              text: "cm",
            ),
            Flexible(flex: 1, child: Container()),
            InfoSelectionBottom(
              Screen: 'HEIGHTSCREEN',
              nextScreen: CalorieSelectorScreen(),
              height: _height,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            )
          ],
        ),
      ),
    );
  }
}
