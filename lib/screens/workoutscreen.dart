import 'package:calori_fit/Widgets/AchievementTile.dart';
import 'package:calori_fit/Widgets/CaloriFitTitle.dart';
import 'package:calori_fit/Widgets/Loader.dart';
import 'package:calori_fit/Widgets/SettingsTitle.dart';
import 'package:calori_fit/Widgets/WorkoutScreenOption.dart';
import 'package:calori_fit/models/Achievement.dart';
import 'package:calori_fit/resources/providers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../styles/Colors.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});
  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

String? x = 'Skipping';
String? x2 = '10 minutes';

class _WorkoutScreenState extends State<WorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    var items = [
      'Jogging',
      'Skipping',
      'Running',
      'Light Walk',
      'Swimming',
      'Table Tennis',
      'Lawn Tennis',
      'Football',
      'Cricket',
      'Badminton',
      'Basketball',
    ];

    var items2 = [
      '10 minutes',
      '20 minutes',
      '30 minutes',
      '40 minutes',
      '50 minutes',
      '1 hour',
      '2 hours',
      '3 hours',
    ];

    var items3 = [
      '100 cals',
      '200 cals',
      '300 cals',
      '400 cals',
      '500 cals',
      '600 cals',
      '700 cals',
      '800 cals',
      '900 cals' ,
      '1000 cals',
      '1100 cals',
    ];

    String? dropdownvalue = 'Jogging';
    String? dropdownvalue2 = '10 minutes';
    int v1 = 10;
    int v2 = 200;
    int val = 2000;
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 20,
          vertical: MediaQuery.of(context).size.height / 80),
      child: Column(
        children: [
          const Text(
            'WORKOUT',
            style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                fontFamily: 'IntegralCF'),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
          ),
          Container(
            // padding: const EdgeInsets.symmetric(vertical: 20),
            // width: MediaQuery.of(context).size.width * .8,
            decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(width: 2, color: Colors.transparent),
                    bottom: BorderSide(width: 0, color: grey))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Type of workout',
                      style: TextStyle(fontSize: 18),
                    ),
                    DropdownButton(
                      value: x,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue;
                          // print(newValue);
                          x = dropdownvalue;
                          // v1 = items.indexOf(x!).toString() as int;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Duration of workout',
                      style: TextStyle(fontSize: 18),
                    ),
                    DropdownButton(
                      value: x2,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: items2.map((String items2) {
                        return DropdownMenuItem(
                          value: items2,
                          child: Text(
                            items2,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue2) {
                        setState(() {
                          dropdownvalue2 = newValue2;
                          // print(newValue);
                          x2 = dropdownvalue2;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Unit Calories Burnt',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(items3[items.indexOf(x!)],
                        // textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18)),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Estimated Calories Burnt',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text("$val cals",
                        // textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18)),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

// SizedBox(height: MediaQuery.of(context).size.height / 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text(
//                       'Type of workout',
//                       style: TextStyle(fontSize: 18),
//                     ),
//                     DropdownButton(
//                       value: x,
//                       icon: const Icon(Icons.keyboard_arrow_down),
//                       items: items.map((String items) {
//                         return DropdownMenuItem(
//                           value: items,
//                           child: Text(
//                             items,
//                             textAlign: TextAlign.center,
//                             style: const TextStyle(
//                               fontStyle: FontStyle.normal,
//                               fontWeight: FontWeight.normal,
//                               fontSize: 16,
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           dropdownvalue = newValue;
//                           // print(newValue);
//                           x = dropdownvalue;
//                         });
//                       },
//                     ),
//                   ],
//                 ),
             
