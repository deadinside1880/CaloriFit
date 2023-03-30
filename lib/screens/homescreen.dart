import 'package:calori_fit/Widgets/AddNewMeal.dart';
import 'package:calori_fit/Widgets/BarChartWidget.dart';
import 'package:calori_fit/models/enums.dart';
import 'package:calori_fit/resources/providers.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:isoweek/isoweek.dart';

import '../Widgets/MealButton.dart';
import '../models/Meal.dart';
import '../models/Workout.dart';
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
  double _burntCals = 0;

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
      // print(meal.calorieCount);
    }
  }

  LinearGradient get _calConsumedGradient => const LinearGradient(
        colors: [
          maingreen,
          Color.fromRGBO(86, 200, 100, 1),
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  LinearGradient get _calBurntGradient => LinearGradient(
        colors: [
          Colors.red,
          Colors.red.shade300,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  void getBurntCals() {
    print(context.read<Providers>().getUser.workouts);
    context.read<Providers>().getUser.workouts.map((key, value) {
      for (Workout workout in context.read<Providers>().getWorkouts) {
        if (key == workout.id) {
          _burntCals += workout.calsPerMin * value;
          print(workout.calsPerMin);
        }
      }
      return MapEntry(key, value);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBurntCals();
  }

  @override
  Widget build(BuildContext context) {
    int todaysCals = context
        .watch<Providers>()
        .getUser
        .meals
        .fold(0, (sum, meal) => sum + meal.calorieCount);
    setMeals();
    Week currentWeek = Week.current();
    // print(currentWeek.days[0].toString().split(' ')[0]);
    String wkstart = DateFormat('d MMM yyyy').format(currentWeek.days[0]);
    String wkend = DateFormat('d MMM yyyy').format(currentWeek.days[6]);
    String wk = wkstart + ' - ' + wkend;
    String fullname = context.read<Providers>().getUser.name;
    int limit_cals = context.read<Providers>().getUser.calorieGoal;
    // print("limit of calories for this user:$limit_cals");
    String _firstName;
    int idx = fullname.indexOf(" ");
    if (idx > 0) {
      _firstName = fullname.substring(0, idx);
    } else {
      _firstName = fullname;
    }

    var date = DateTime.now();
    String datestr = DateFormat('EEEE, d MMM yyyy').format(date);
    // print(datestr);
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
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'IntegralCF'),
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
                                    linearGradient: _calConsumedGradient,
                                    rotateLinearGradient: true,
                                    radius:
                                        MediaQuery.of(context).size.width / 3,
                                    lineWidth: 11,
                                    backgroundColor: const Color(0xFF7F7F7F),
                                    // progressColor: maingreen,
                                    percent: limit_cals == 0
                                        ? 0
                                        : todaysCals / limit_cals >= 1
                                            ? 1
                                            : todaysCals / limit_cals,
                                    circularStrokeCap: CircularStrokeCap.round,
                                    animation: true,
                                    animationDuration: 500,
                                  ),
                                  CircularPercentIndicator(
                                    linearGradient: _calBurntGradient,
                                    rotateLinearGradient: true,
                                    radius:
                                        MediaQuery.of(context).size.width / 3 -
                                            30,
                                    lineWidth: 11,
                                    backgroundColor: const Color(0xFF7F7F7F),
                                    // progressColor: maingreen,
                                    percent: limit_cals == 0
                                        ? 0
                                        : _burntCals / limit_cals >= 1
                                            ? 1
                                            : _burntCals / limit_cals,
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
                                            fontFamily: 'IntegralCF',
                                            color: Color.fromRGBO(
                                                255, 255, 255, 0.6)),
                                      ),
                                      FittedBox(
                                          child: Text(
                                        "$todaysCals cals",
                                        style: const TextStyle(
                                            fontFamily: 'IntegralCF',
                                            fontSize: 27,
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
                                    .weeklyCalories,
                                wk_lst: wk,
                                limit: limit_cals,
                              )),
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
          Flexible(
              child: ListView(
            children: [
              MealButton(
                  cal: breakfast == null ? 0 : breakfast!.calorieCount,
                  meal: "Breakfast",
                  color: green1,
                  dosumn: breakfast == null
                      ? () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AddNewMealWidget(
                              color: green1, meal: "Breakfast")))
                      : () {}),
              const SizedBox(
                height: 15,
              ),
              MealButton(
                  cal: lunch == null ? 0 : lunch!.calorieCount,
                  meal: "Lunch",
                  color: green2,
                  dosumn: lunch == null
                      ? () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AddNewMealWidget(
                              color: green2, meal: "Lunch")))
                      : () {}),
              const SizedBox(
                height: 15,
              ),
              MealButton(
                  cal: dinner == null ? 0 : dinner!.calorieCount,
                  meal: "Dinner",
                  color: green3,
                  dosumn: dinner == null
                      ? () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AddNewMealWidget(
                              color: green3, meal: "Dinner")))
                      : () {})
            ],
          )),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
