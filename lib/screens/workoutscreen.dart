import 'package:calori_fit/Widgets/Loader.dart';
import 'package:calori_fit/styles/Colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection("workouts").get(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          return Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/20),
            child: Column(
              children: [
                SizedBox( height: MediaQuery.of(context).size.height/10,),
                const Text('Add Workout', style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold, fontFamily: 'IntegralCF'),),
                SizedBox( height: MediaQuery.of(context).size.height/10,),
                Row(
                  children: [
                    Text("Type of Workout"),
                    Flexible(flex: 1, child: Container()),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Container(
                      width: 50,
                      child: const Text("Duration of workout"),
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Container(
                      width: 50,
                      child: const Text("Unit calorie burnout"),
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Container(
                      width: 50,
                      child: const Text("Expected amount of calories burnt"),
                    )
                  ],
                ),
                const SizedBox(height: 10,),
                Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    color: maingreen,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: const Text("Save Results", style: TextStyle(color: Colors.black),),
                ),
                const SizedBox(height: 20,),
                const Text("We have a personally curated list of workout v/s calorie consumption, and based on the duration of workout, we help you track how much calories you have burnt today!",
                  style: TextStyle(),
                  )
              ],
            ),
          );
        }else{
          return const Loader();
        }
      }
    );
  }
}