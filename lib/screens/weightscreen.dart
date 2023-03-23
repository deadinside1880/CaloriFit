import 'package:calori_fit/Widgets/InfoSelectionBottom.dart';
import 'package:calori_fit/screens/heightscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../Widgets/CaloriFitTitle.dart';

class WeightSelector extends StatefulWidget {
  const WeightSelector({super.key});

  @override
  State<WeightSelector> createState() => _WeightSelectorState();
}

class _WeightSelectorState extends State<WeightSelector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           SizedBox(height: MediaQuery.of(context).size.height/10,),
           const CaloriFitTitle(color: Colors.white),
           SizedBox(height: MediaQuery.of(context).size.height/10,),
           const Text("HOW OLD ARE YOU?", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),),
           const SizedBox(height: 15,),
           const Text("THIS HELPS US CREATE YOUR PERSONALIZED PLAN"),
           const SizedBox(height: 10,),
           const InfoSelectionBottom(Screen: "WEIGHTSCREEN", nextScreen: HeightSelectorScreen(), weight: 50,)
        ],
      ),
    );
  }
}