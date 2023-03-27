import 'package:calori_fit/Widgets/AddNewMeal.dart';
import 'package:calori_fit/Widgets/BarChartWidget.dart';
import 'package:calori_fit/models/enums.dart';
import 'package:calori_fit/resources/providers.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../Widgets/MealButton.dart';
import '../models/Meal.dart';
import '../styles/Colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isfirstWidget = true;
  Meal? breakfast;
  Meal? lunch;
  Meal? dinner;

  setMeals() {
    List<Meal> meals = context.read<Providers>().getUser.meals;
    for (Meal meal in meals) {
      switch (meal.mealType) {
        case MealType.BREAKFAST:
          {
            breakfast = meal;
          }
          break;
        case MealType.LUNCH:
          {
            lunch = meal;
          }
          break;
        case MealType.DINNER:
          {
            dinner = meal;
          }
          break;
      }
      print(meal.calorieCount);
    }
  }

  @override
  Widget build(BuildContext context) {
    int todaysCals = context
        .watch<Providers>()
        .getUser
        .meals
        .fold(0, (sum, meal) => sum + meal.calorieCount);
    setMeals();

    String fullname = context.read<Providers>().getUser.name;
    String _firstName;
    int idx = fullname.indexOf(" ");
    if (idx > 0) {
        _firstName = fullname.substring(0, idx);} 
    else {
        _firstName = fullname;
    }

    var date = DateTime.now();
    String datestr = DateFormat('EEEE, d MMM yyyy').format(date);
    print(datestr);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 20),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    "Welcome $_firstName!",
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700, fontFamily: 'IntegralCF'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(datestr, style: const TextStyle(fontSize: 20))
                ],
              ),
              Flexible(child: Container()),
              
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          AnimatedContainer(
              duration: const Duration(seconds: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * 0.7,
                    child: GestureDetector(
                        onHorizontalDragEnd: (details) {
                          setState(() {
                            _isfirstWidget = !_isfirstWidget;
                          });
                        },
                        child: _isfirstWidget
                            ? Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircularPercentIndicator(
                                    radius:
                                        MediaQuery.of(context).size.width / 3.2,
                                    lineWidth: 18,
                                    backgroundColor: const Color(0xFF7F7F7F),
                                    progressColor: maingreen,
                                    percent: context
                                                .watch<Providers>()
                                                .getUser
                                                .calorieGoal ==
                                            0
                                        ? 0
                                        : todaysCals /
                                            context
                                                .watch<Providers>()
                                                .getUser
                                                .calorieGoal,
                                    circularStrokeCap: CircularStrokeCap.round,
                                    animation: true,
                                    animationDuration: 500,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Today",
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Color.fromRGBO(
                                                255, 255, 255, 0.6)),
                                      ),
                                      FittedBox(
                                          child: Text(
                                        "$todaysCals cal",
                                        style: const TextStyle(
                                            fontSize: 48,
                                            fontWeight: FontWeight.w600),
                                      ))
                                    ],
                                  ),
                                ],
                              )
                            : BarChartWidget(
                                weeklyCalories: context
                                    .read<Providers>()
                                    .getUser
                                    .weeklyCalories)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        height: 5,
                        width: _isfirstWidget ? 40 : 15,
                        color: _isfirstWidget ? maingreen : grey,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: 5,
                        width: !_isfirstWidget ? 40 : 15,
                        color: !_isfirstWidget ? maingreen : grey,
                      ),
                    ],
                  )
                ],
              )),
          const SizedBox(
            height: 35,
          ),
          Material(
              child: MealButton(
                  cal: breakfast == null ? 0 : breakfast!.calorieCount,
                  meal: "Breakfast",
                  color: green1,
                  dosumn: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AddNewMealWidget(
                          color: green1, meal: "Breakfast"))))),
          const SizedBox(
            height: 15,
          ),
          Material(
              child: MealButton(
                  cal: lunch == null ? 0 : lunch!.calorieCount,
                  meal: "Lunch",
                  color: green2,
                  dosumn: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AddNewMealWidget(
                          color: green2, meal: "Lunch"))))),
          const SizedBox(
            height: 15,
          ),
          Material(
              child: MealButton(
                  cal: dinner == null ? 0 : dinner!.calorieCount,
                  meal: "Dinner",
                  color: green3,
                  dosumn: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AddNewMealWidget(
                          color: green3, meal: "Dinner"))))),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
