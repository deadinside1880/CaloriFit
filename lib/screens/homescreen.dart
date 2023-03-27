import 'package:calori_fit/Widgets/AddNewMeal.dart';
import 'package:calori_fit/Widgets/BarChartWidget.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../Widgets/MealButton.dart';
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
      //  today;
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
    print(DateTime.now());
    DateTime today_date = DateTime.now();
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
                    "Good Morning!",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  // Text("Monday, February 07, 2023")

                  Text(
                      '${today_date.day}-${today_date.month}-${today_date.year}')
                ],
              ),
              Flexible(child: Container()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Icon(
                    Icons.sunny,
                    color: Colors.yellow,
                  ),
                  Text("28C"),
                  Text("Singapore")
                ],
              )
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
                                    lineWidth: 15,
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
                                    rotateLinearGradient: true,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Today",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Color.fromRGBO(
                                                255, 255, 255, 0.6)),
                                      ),
                                      FittedBox(
                                          child: Text(
                                        "$todaysCals cal",
                                        style: const TextStyle(
                                            fontSize: 45,
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
            height: 20,
          ),
          Material(
              child: MealButton(
<<<<<<< Updated upstream
                meal: "Breakfast", 
                color: green1, 
                dosumn: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddNewMealWidget(color: green1, meal: "Breakfast")))
              )
            ),
            const SizedBox(height: 10,),
            Material(
              child: MealButton(
                meal: "Lunch", 
                color: green2, 
                dosumn: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddNewMealWidget(color: green2, meal: "Lunch")))
              )
            ),
            const SizedBox(height: 10,),
            Material(
              child: MealButton(
                meal: "Dinner", 
                color: green3, 
                dosumn: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddNewMealWidget(color: green3, meal: "Dinner")))
              )
            ),
            const SizedBox(height: 10,),
          ],
        ),
      );
=======
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
            height: 10,
          ),
        ],
      ),
    );
>>>>>>> Stashed changes
  }
}
