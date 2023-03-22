import 'package:flutter/material.dart';

class AchievementTile extends StatefulWidget {

  const AchievementTile({
    super.key,
    required this.achievementTitle,
    required this.achievementDescription,
    required this.progress
    });

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

  void updateProgress(){
    setState(() {
      //animate = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          color: const Color(0xFF1C1C1E),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.apple_rounded, size: 50,),
            const SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.achievementTitle),
                const SizedBox(height: 10,),
                Text(widget.achievementDescription),
                const SizedBox(height: 10,),
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
                          borderRadius: BorderRadius.circular(5)
                        ),
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