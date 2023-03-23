import 'package:calori_fit/Widgets/AddNewMeal.dart';
import 'package:calori_fit/Widgets/BarChartWidget.dart';
import 'package:calori_fit/resources/providers.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../Widgets/MealButton.dart';
import '../styles/Colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool _isfirstWidget = true;
  int _consumedCal = 680;
  int _calGoal = 2400;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/20),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Good Morning!", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),),
                    SizedBox(height: 10,),
                    Text("Monday, February 07, 2023")
                  ],
                ),
                Flexible(child: Container()),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Icon(Icons.sunny,color: Colors.yellow,),
                    Text("28C"),
                    Text("Singapore")
                  ],
                )
              ],
            ),
            const SizedBox(height: 30,),
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
                      child: 
                      _isfirstWidget? 
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularPercentIndicator(
                            radius: MediaQuery.of(context).size.width/4,
                            lineWidth: 13,
                            backgroundColor: const Color(0xFF7F7F7F),
                            progressColor: maingreen,
                            percent: context.watch<Providers>().getUser.meals.fold(0, (sum, meal) => sum+meal.calorieCount) 
                              / context.watch<Providers>().getUser.calorieGoal,
                            //percent: _consumedCal / _calGoal,
                            // center: Column(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   crossAxisAlignment: CrossAxisAlignment.center,
                            //   children: const[
                            //     Text("Today", style: TextStyle(fontSize: 25),),
                            //     FittedBox(child: Text("680 cal", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),))
                            //   ],
                            // ),
                            circularStrokeCap: CircularStrokeCap.round,
                            animation: true,
                            animationDuration: 500,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const[
                                Text("Today", style: TextStyle(fontSize: 18, color: Color.fromRGBO(255, 255, 255, 0.6)),),
                                FittedBox(child: Text("680 cal", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),))
                              ],
                            ),
                        ],
                      )
                      :
                      const BarChartWidget()
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        height: 5, 
                        width: _isfirstWidget? 40:15, 
                        color: _isfirstWidget? maingreen : grey,
                      ),
                      const SizedBox(width: 10,),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: 5, 
                        width: !_isfirstWidget? 40:15, 
                        color: !_isfirstWidget? maingreen : grey,
                      ),
                    ],
                  )
                ],
              )
            ),
            const SizedBox(height: 20,),
            Material(
              child: MealButton(
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
  }
}
