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
                // const SettingsTitle(text: "ACHIEVEMENTS", isResultScreen: true,),
                const Text('ACHIEVEMENTS', style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold, fontFamily: 'IntegralCF'),),
                SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                CircleAvatar(
                  backgroundImage: NetworkImage(context.read<Providers>().getUser.photoURL),
                  radius: 100,
                  ),
                const SizedBox(height: 60,),
                Container(
                  height: MediaQuery.of(context).size.height/2-120,
                  child: ListView(
                    children: [
                      ...snapshot.data!.docs.map((snap){
                      Achievement achievement = Achievement.modelFromSnap(snap);
                      return AchievementTile(achievement: achievement,);
                  })
                    ],
                  ),
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