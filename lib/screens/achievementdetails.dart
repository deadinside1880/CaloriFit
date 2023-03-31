import 'dart:ffi';
import 'dart:math';

import 'package:calori_fit/models/Achievement.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';

import '../styles/Colors.dart';

class AchievementDetails extends StatefulWidget {
  final Achievement achievement;
  const AchievementDetails({super.key, required this.achievement});

  @override
  State<AchievementDetails> createState() => _AchievementDetailsState();
}

class _AchievementDetailsState extends State<AchievementDetails> {
  late ConfettiController _BLconfettiController;
  late ConfettiController _BRconfettiController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _BLconfettiController = ConfettiController(duration: const Duration(seconds: 3));
    _BRconfettiController = ConfettiController(duration: const Duration(seconds: 3));
  }

  @override
  void dispose(){
    super.dispose();
    _BLconfettiController.dispose();
    _BRconfettiController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _BLconfettiController.play();
    _BRconfettiController.play();
    double angle = atan(MediaQuery.of(context).size.height/MediaQuery.of(context).size.width);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 20,
                vertical: MediaQuery.of(context).size.height / 20),
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
                            borderRadius: BorderRadius.circular(20), color: grey),
                        child: const Icon(
                          Icons.keyboard_arrow_left_outlined,
                          size: 25,
                        ),
                      ),
                    ),
                    Flexible(child: Container()),
                    Center(
                        child: IconButton(
                            onPressed: () {
                              Share.share(
                                  'Hey! Check my achievement out! I achieved ${widget.achievement.title}.\nDownload CaloriFit to achieve your fitness goals! https://play.google.com/store/apps/details?id=com.calorifit');
                            },
                            icon: const Icon(Icons.share))),
                    //Flexible(child: Container()),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.achievement.title,
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                ),
                Hero(
                  tag: 'trial${widget.achievement.id}',
                  child: ClipOval(
                    child: Shimmer(
                      duration: const Duration(seconds: 2),
                      direction: const ShimmerDirection.fromLBRT(),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(widget.achievement.photoURL),
                        radius: 150,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                ),
                const Text("CONGRATULATIONS!!!"),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "You have completed this achievement! We are very proud of you for coming this far! We hope you continue your journey to glory with us!",
                  style: TextStyle(),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Row(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: ConfettiWidget(
                  confettiController: _BLconfettiController,
                  blastDirection: -angle,
                  shouldLoop: false,
                  numberOfParticles: 20,
                  minBlastForce: 80,
                  maxBlastForce: 120,
                  gravity: 0.3,
                ),
              ),
              Flexible(child: Container()),
              Align(
                alignment: Alignment.bottomRight,
                child: ConfettiWidget(
                  confettiController: _BRconfettiController,
                  blastDirection: pi+angle,
                  shouldLoop: false,
                  numberOfParticles: 20,
                  minBlastForce: 80,
                  maxBlastForce: 120,
                  gravity: 0.3,
                  particleDrag: 0.04,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
