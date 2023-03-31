import 'package:calori_fit/Widgets/Loader.dart';
import 'package:calori_fit/Widgets/WorkoutRow.dart';
import 'package:calori_fit/models/Workout.dart';
import 'package:calori_fit/resources/auth.dart';
import 'package:calori_fit/styles/Colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../resources/providers.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  final TextStyle textStyle = const TextStyle(
    fontSize: 18,
  );
  final List<String> fields = [
    "Duration of Workout",
    "Unit calorie burnout",
    "Expected amount of calories burnt"
  ];
  List<Workout> workouts = [];
  Map<String, String> nameToId = {};
  TextEditingController durationController = TextEditingController();
  TextEditingController dropdownController = TextEditingController();
  int duration = 0;
  late Workout currentWorkout;

  void addWorkout()async{
    duration = int.parse(durationController.text==""?"0":durationController.text);
    print(duration);
    if(duration == 0){
      return;
    }
    context.read<Providers>().addWorkout(nameToId[currentWorkout.name]!, duration);
    AuthMethods _amo = AuthMethods();
    await _amo.updateUser(context.read<Providers>().getUser);
    dropdownController.clear();
    durationController.clear();
    if(context.mounted){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("YAYY!! AMAZING WORK FOR COMPLETING THIS WORKOUT!!")));
    }
  }

  @override
  void initState() {
    // TODO: implement initS
    super.initState();
    workouts = context.read<Providers>().getWorkouts;
    for(Workout workout in workouts){
      nameToId[workout.name] = workout.id;
    }
    currentWorkout = workouts[0];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    durationController.dispose();
    dropdownController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 20),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
          ),
          const Text(
            'Add Workout',
            style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                fontFamily: 'IntegralCF'),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              children: [
                Container(
                  width: 150,
                  child: const Text(
                    "Type of Workout",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Flexible(
                  child: Container(),
                ),
                DropdownMenu(
                  initialSelection: currentWorkout.name,
                  enableFilter: true,
                  dropdownMenuEntries: workouts
                      .map((workout) => DropdownMenuEntry(
                          value: workout.name, label: workout.name))
                      .toList(),
                  onSelected: (selectedWorkout) {
                    for (Workout workout in workouts) {
                      if (workout.name == selectedWorkout) {
                        setState(() {
                          currentWorkout = workout;
                        });
                      }
                    }
                  },
                )
              ],
            ),
          ),
          ...fields.asMap().entries.map((text) => WorkoutRow(
                rowNum: text.key,
                text: text.value,
                workout: currentWorkout,
                durationController: durationController,
              )),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            decoration: BoxDecoration(
                color: maingreen, borderRadius: BorderRadius.circular(50)),
            child: GestureDetector(
              onTap: addWorkout,
              child: const Text(
                "Save Results",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "We have a personally curated list of workout v/s calorie consumption, and based on the duration of workout, we help you track how much calories you have burnt today!",
            style: TextStyle(height: 1.8, fontSize: 18),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
