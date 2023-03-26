import 'dart:io';

import 'package:calori_fit/Widgets/IDResultsTile.dart';
import 'package:calori_fit/Widgets/Loader.dart';
import 'package:calori_fit/Widgets/SettingsTitle.dart';
import 'package:calori_fit/models/enums.dart';
import 'package:calori_fit/resources/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../models/Meal.dart';
import '../resources/providers.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({
    super.key,
    required this.mealType,
    required this.food,
    required this.image
    });
  final File image;
  final String mealType;
  final String food;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

  void updateMeal(int cals)async {
    MealType mealtype = widget.mealType == "Breakfast"? MealType.BREAKFAST : widget.mealType == "Lunch"? MealType.LUNCH : MealType.DINNER;
    context.read<Providers>().addMeal(Meal(mealType: mealtype, calorieCount: cals, meal: widget.mealType));
    AuthMethods _amo = AuthMethods();
    await _amo.updateUser(context.watch<Providers>().getUser);
    print(context.read<Providers>().getUser.meals);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection("foods").where("name", isEqualTo: widget.food).get(),
        builder : (context, snapshot){
          if(snapshot.hasData){
            updateMeal(snapshot.data!.docs[0]['calories']);
            print(widget.food);
            print(snapshot.data);
            return Container(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height/20, 
                horizontal: MediaQuery.of(context).size.width/20
              ),
              child: Column(
                children: [
                  SettingsTitle(text: widget.mealType, isResultScreen: true,),
                  const SizedBox(height: 20,),
                  Container(
                    child: Image.file(widget.image,),
                  ),
                  SizedBox(height: 20,),
                  const Text(
                    "Based on our AI engine, we have identified the following food items:", 
                    style: TextStyle(), 
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10,),
                  IDResultsTile(
                    meal: widget.food, 
                    isLastOption:true, 
                    cals: snapshot.data!.docs[0]['calories'], 
                    ),
                  const SizedBox(height: 20,),
                  const Text("Feel these are not accurate? Please let us know!", style: TextStyle(),)
                ],
              ),
            );
          }else{
            return const Loader();
          }
        }
      ),
    );
  }
}