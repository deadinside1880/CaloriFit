import 'package:calori_fit/screens/homescreen.dart';
import 'package:flutter/material.dart';

import '../Widgets/CaloriFitTitle.dart';
import '../Widgets/InfoSelectionBottom.dart';
import '../Widgets/WheelScroller.dart';
import '../styles/Colors.dart';
import 'home.dart';
import 'loginscreen.dart';

class CalorieSelectorScreen extends StatefulWidget {
  const CalorieSelectorScreen({super.key});

  @override
  State<CalorieSelectorScreen> createState() => _CalorieSelectorScreenState();
}

class _CalorieSelectorScreenState extends State<CalorieSelectorScreen> {

  int _calorieGoal = 1500;

  void updateCalorieGoal(int calorieGoal){
    setState(() {
      _calorieGoal = calorieGoal*100 + 1500;
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
            const Text("WHAT'S YOUR GOAL?", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),),
            const SizedBox(height: 15,),
            const Text("THIS HELPS US CREATE YOUR PERSONALIZED PLAN"),
            const SizedBox(height: 10,),
            WheelScroller(setValue: (value) => updateCalorieGoal(value), minimum: 1500, maximum: 4000, lineWidth: 200, text: "cal", step: 100,),
            Flexible(flex: 1, child: Container()),
            InfoSelectionBottom(Screen: "CALORIESCREEN", nextScreen: Home(), calorieGoal: _calorieGoal,),
            InkWell( onTap: () => print(_calorieGoal), child: Container( height: 20, width: 20, color: maingreen,),),
            SizedBox(height: MediaQuery.of(context).size.height/10,)
          ],
        ),
      ),
    );
  }
}