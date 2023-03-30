import 'package:calori_fit/models/Achievement.dart';
import 'package:calori_fit/resources/providers.dart';
import 'package:calori_fit/screens/achievementdetails.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AchievementTile extends StatefulWidget {
  const AchievementTile({super.key, required this.achievement});

  final Achievement achievement;

  @override
  State<AchievementTile> createState() => _AchievementTileState();
}

class _AchievementTileState extends State<AchievementTile> {
  //final ?? achievementImage;
  final double progressBarLength = 200;
  bool animate = false;

  void updateProgress() {
    setState(() {
      //animate = true;
    });
  }

  // Widget heroAnimation (flightContext, animation, flightDirection, fromHeroContext, toHeroContext) {
  //   return Transform.
  // }

  @override
  Widget build(BuildContext context) {
    double progress = context.read<Providers>().getUser.highestStreak /
        widget.achievement.goal;
    if (progress > 1) progress = 1;
    return GestureDetector(
      onTap: progress == 1
          ? () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AchievementDetails(
                    achievement: widget.achievement,
                  )))
          : () {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
            color: const Color(0xFF1C1C1E),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
                // flightShuttleBuilder: heroAnimation,
                tag: 'trial${widget.achievement.id}',
                child: CircleAvatar(
                  backgroundImage: NetworkImage(widget.achievement.photoURL),
                  radius: 35,
                )),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.achievement.title,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w900)),
                const SizedBox(
                  height: 7.9,
                ),
                Text("${widget.achievement.goal} day(s) streak successfully!"),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  clipBehavior: Clip.antiAlias,
                  width: progressBarLength,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 500),
                    //decoration: BoxDecoration(),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 10,
                        width: progressBarLength * progress,
                        decoration: BoxDecoration(
                            color: const Color(0xFF83F7AF),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
