import 'package:calori_fit/Widgets/InfoSelectionBottom.dart';
import 'package:calori_fit/Widgets/ScrollTile.dart';
import 'package:calori_fit/Widgets/WheelScroller.dart';
import 'package:calori_fit/screens/weightscreen.dart';
import 'package:calori_fit/styles/Colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wheel_chooser/wheel_chooser.dart';
import '../Widgets/CaloriFitTitle.dart';

class AgeSelectorScreen extends StatefulWidget {
  const AgeSelectorScreen({super.key});

  @override
  State<AgeSelectorScreen> createState() => _AgeSelectorScreenState();
}

class _AgeSelectorScreenState extends State<AgeSelectorScreen> {

  int _age = 0;

  void updateAge(int age){
    setState(() {
      _age = age + 15;
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
            const Text("HOW OLD ARE YOU?", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),),
            const SizedBox(height: 15,),
            const Text("THIS HELPS US CREATE YOUR PERSONALIZED PLAN"),
            const SizedBox(height: 10,),
            WheelScroller(setAge: (value) => updateAge(value)),
            Flexible(flex: 1, child: Container()),
            const InfoSelectionBottom(isGenderScreen: false, nextScreen: WeightSelector()),
            SizedBox(height: MediaQuery.of(context).size.height/10,)
          ],
        ),
      ),
    );
  }
}