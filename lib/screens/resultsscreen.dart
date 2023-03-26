import 'package:calori_fit/Widgets/IDResultsTile.dart';
import 'package:calori_fit/Widgets/SettingsTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../models/Meal.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.meal, required this.foods});
  final String meal;
  final List<Meal> foods;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height/20, 
          horizontal: MediaQuery.of(context).size.width/20
        ),
        child: Column(
          children: [
            SettingsTitle(text: meal),
            const SizedBox(height: 20,),
            const Text("Based on our AI engine, we have identified the following food items:", style: TextStyle(),),
            const SizedBox(height: 10,),
            ...foods.asMap().entries.map((food) => IDResultsTile(
              meal: meal, 
              isLastOption: food.key == foods.length-1? true: false, 
              cals: food.value.calorieCount, 
              index: food.key
              )),
            const SizedBox(height: 20,),
            const Text("Feel these are not accurate? Please let us know!", style: TextStyle(),)
          ],
        ),
      ),
    );
  }
}