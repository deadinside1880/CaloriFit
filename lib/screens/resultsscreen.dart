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
  const ResultScreen(
      {super.key,
      required this.mealType,
      required this.food,
      required this.image});
  final File image;
  final String mealType;
  final String food;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  void updateMeal(int cals) async {
    bool exists = false;
    MealType mealtype = widget.mealType == "Breakfast"
        ? MealType.BREAKFAST
        : widget.mealType == "Lunch"
            ? MealType.LUNCH
            : MealType.DINNER;
    for (int i = 0; i < context.read<Providers>().getUser.meals.length; i++) {
      if (context.read<Providers>().getUser.meals[i].mealType == mealtype) {
        exists = true;
        print("found duplicate");
      }
    }
    if (exists) {
      return;
    }
    print("after duplicate check");
    context.read<Providers>().addMeal(
        Meal(mealType: mealtype, calorieCount: cals, meal: widget.mealType));
    updateWeekly(mealtype, cals);
    AuthMethods _amo = AuthMethods();
    await _amo.updateUser(context.watch<Providers>().getUser);
  }

  void updateWeekly(MealType mealType, int cals) {
    List<int> weeklyCalories = context.read<Providers>().getUser.weeklyCalories;
    if (mealType == MealType.BREAKFAST) {
      weeklyCalories.add(cals);
    } else {
      weeklyCalories[weeklyCalories.length - 1] += cals;
    }
    context.read<Providers>().setWeeklyCals = weeklyCalories;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection("foods")
              .where("name", isEqualTo: widget.food)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              updateMeal(snapshot.data!.docs[0]['calories']);
              return Container(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / 20,
                    horizontal: MediaQuery.of(context).size.width / 20),
                child: Column(
                  children: [
                    const SettingsTitle(
                      text: "Add New Meal",
                      isResultScreen: true,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      widget.mealType,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'IntegralCF',
                      ),
                    ),
                    // SettingsTitle(
                    //   text: widget.mealType,
                    //   isResultScreen: true,
                    // ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Image.file(
                        widget.image,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "\nBased on our AI engine, we have identified the following food items:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    IDResultsTile(
                      meal: widget.food,
                      isLastOption: true,
                      cals: snapshot.data!.docs[0]['calories'],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Flexible(flex: 1, child: Container()),
                    const Text(
                      "Feel these are not accurate? Please let us know!",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              );
            } else {
              return const Loader();
            }
          }),
    );
  }
}
