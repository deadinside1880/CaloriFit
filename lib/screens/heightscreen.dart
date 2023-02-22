import 'package:calori_fit/screens/caloriescreen.dart';
import 'package:calori_fit/screens/loginscreen.dart';
import 'package:calori_fit/styles/Colors.dart';
import 'package:flutter/material.dart';

import '../Widgets/CaloriFitTitle.dart';
import '../Widgets/InfoSelectionBottom.dart';
import '../Widgets/WheelScroller.dart';
class HeightSelectorScreen extends StatefulWidget {
  const HeightSelectorScreen({super.key});

  @override
  State<HeightSelectorScreen> createState() => _HeightSelectorScreenState();
}

class _HeightSelectorScreenState extends State<HeightSelectorScreen> {
  int _height = 130;

  void updateHeight(int height){
    setState(() {
      _height = height + 130;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height/10,),
            const CaloriFitTitle(color: Colors.white),
            SizedBox(height: MediaQuery.of(context).size.height/10,),
            const Text("WHAT'S YOUR HEIGHT?", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),),
            const SizedBox(height: 15,),
            const Text("THIS HELPS US CREATE YOUR PERSONALIZED PLAN"),
            const SizedBox(height: 10,),
            WheelScroller(setValue: (value) => updateHeight(value), minimum: 130, maximum: 200, lineWidth: 150, text: "cm",),
            Flexible(flex: 1, child: Container()),
            const InfoSelectionBottom(isGenderScreen: false, nextScreen: CalorieSelectorScreen()),
            InkWell( onTap: () => print(_height), child: Container( height: 20, width: 20, color: maingreen,),),
            SizedBox(height: MediaQuery.of(context).size.height/10,)
          ],
        ),
      ),
    );
  }
}