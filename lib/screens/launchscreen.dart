import 'package:calori_fit/screens/onboarding.dart';
import 'package:flutter/material.dart';
import '../Widgets/CaloriFitTitle.dart';
import '../styles/Styles.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Container(),
          ),
          Image.asset("assets/Logo.png"),
          SizedBox(
            height: MediaQuery.of(context).size.height / 30,
          ),
          const CaloriFitTitle(color: Colors.white),
          SizedBox(height: MediaQuery.of(context).size.height / 27),
          const Text(
            "not your average calorie counting app :)",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.white,),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 17),
          GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const OnboardingScreen())),
              child: Container(
                  // padding: const EdgeInsets.fromLTRB(30, 25, 30, 25),
                  padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 35),
                  // width: double.infinity,
                  decoration: buttonShapeDecor,
                  child: const Text("Let's get started!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)))),
          SizedBox(height: MediaQuery.of(context).size.height / 8)
        ],
      ),
    ));
  }
}
