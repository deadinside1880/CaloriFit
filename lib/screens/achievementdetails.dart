import 'package:calori_fit/models/Achievement.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../styles/Colors.dart';

class AchievementDetails extends StatelessWidget {
  final Achievement achievement;
  const AchievementDetails({super.key, required this.achievement});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width/20, 
          vertical: MediaQuery.of(context).size.height/20
        ),
        child: Column(
          children: [
            Row( 
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: grey
                    ),
                    child: const Icon(Icons.keyboard_arrow_left_outlined, size: 25,),
                  ),
                ),
                Flexible(child: Container()),
                Center(
                  child: IconButton(
                    onPressed: (){}, 
                    icon: const Icon(Icons.share)
                  )
                ),
                //Flexible(child: Container()),
              ],
            ),
            const SizedBox(height: 10,),
            Text(achievement.title, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            SizedBox(height: MediaQuery.of(context).size.height/10,),
            CircleAvatar(
              backgroundImage: NetworkImage(achievement.photoURL),
              radius: 150,
            ),
            SizedBox(height: MediaQuery.of(context).size.height/10,),
            const Text("CONGRATULATIONS!!!"),
            const SizedBox(height: 10,),
            const Text("You have completed this achievement! We are very proud of you for coming this far! We hope you continue your journey to glory with us!",
             style: TextStyle(),
             textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}