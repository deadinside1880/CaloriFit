import 'package:flutter/material.dart';

class AchievementTile extends StatefulWidget {
<<<<<<< Updated upstream

  const AchievementTile({
    super.key,
    required this.achievementTitle,
    required this.achievementDescription,
    required this.progress
    });
=======
  const AchievementTile({super.key, required this.achievement});
>>>>>>> Stashed changes

  final String achievementTitle;
  final String achievementDescription;
  final num progress;

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

  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    return GestureDetector(
      onTap: (){},
=======
    double progress = context.read<Providers>().getUser.highestStreak /
        widget.achievement.goal;
    if (progress > 1) progress = 1;
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AchievementDetails(
                achievement: widget.achievement,
              ))),
>>>>>>> Stashed changes
      child: Container(
        margin: const EdgeInsets.only(bottom: 35),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
            color: const Color(0xFF1C1C1E),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
<<<<<<< Updated upstream
            const Icon(Icons.apple_rounded, size: 50,),
            const SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.achievementTitle),
                const SizedBox(height: 10,),
                Text(widget.achievementDescription),
                const SizedBox(height: 10,),
=======
            CircleAvatar(
                backgroundImage: NetworkImage(widget.achievement.photoURL),
                radius: 35),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.achievement.title, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500)),
                const SizedBox(
                  height: 5,
                ),
                Text("${widget.achievement.goal} day(s) streak"),
                const SizedBox(
                  height: 10,
                ),
>>>>>>> Stashed changes
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
                        width: progressBarLength*widget.progress,
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
