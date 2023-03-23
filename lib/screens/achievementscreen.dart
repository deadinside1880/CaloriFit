import 'package:calori_fit/Widgets/AchievementTile.dart';
import 'package:calori_fit/Widgets/CaloriFitTitle.dart';
import 'package:calori_fit/Widgets/SettingsTitle.dart';
import 'package:flutter/material.dart';

class AchievementScreen extends StatelessWidget {
  const AchievementScreen({super.key, required this.photoURL});
  final String photoURL;

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
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width/20, 
        vertical: MediaQuery.of(context).size.height/80
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SettingsTitle(text: "ACHIEVEMENTS"),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),
          CircleAvatar(
            backgroundImage: NetworkImage(photoURL),
            radius: 60,
            ),
          const SizedBox(height: 30,),
          ...achievements.map((achievement) =>
            AchievementTile(
              achievementTitle: achievement['title'] as String, 
              achievementDescription:achievement['description'] as String,
              progress: achievement['progress'] as num,
            )
          )
        ],
      ),
    );
  }
}