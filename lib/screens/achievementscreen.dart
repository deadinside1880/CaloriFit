import 'package:calori_fit/Widgets/AchievementTile.dart';
import 'package:calori_fit/Widgets/CaloriFitTitle.dart';
import 'package:calori_fit/Widgets/Loader.dart';
import 'package:calori_fit/Widgets/SettingsTitle.dart';
import 'package:calori_fit/models/Achievement.dart';
import 'package:calori_fit/resources/providers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AchievementScreen extends StatelessWidget {
  const AchievementScreen({super.key});

  static const achievements = [
    {
      'title' : 'Quarter Manager',
      'description' : '3 months streak',
      'progress' : 0.33
    },
    {
      'title' : 'B2B Months Success',
      'description' : '2 months streak',
      'progress' : 0.67
    },
    {
      'title' : 'Monthly Routine',
      'description' : '1 month streak',
      'progress' : 1
    },
    {
      'title' : 'More than a week',
      'description' : '8 days streak',
      'progress' : 1
    }
  ];
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection("achievements").orderBy("goal", descending: false).get(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width/20, 
              vertical: MediaQuery.of(context).size.height/80
              ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SettingsTitle(text: "ACHIEVEMENTS"),
                SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                CircleAvatar(
                  backgroundImage: NetworkImage(context.read<Providers>().getUser.photoURL),
                  radius: 100,
                  ),
                const SizedBox(height: 60,),
                ...snapshot.data!.docs.map((snap){
                  Achievement achievement = Achievement.modelFromSnap(snap);
                  return AchievementTile(achievement: achievement,);
                })
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