import 'package:calori_fit/styles/Colors.dart';
import 'package:calori_fit/styles/PrivacyPolicy.dart';
import 'package:flutter/material.dart';

import '../Widgets/CaloriFitTitle.dart';
import '../Widgets/SettingsTitle.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 20,
            vertical: MediaQuery.of(context).size.height / 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // const CaloriFitTitle(color: Colors.white),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            const SettingsTitle(text: "ABOUT US"),
            SizedBox(
              height: MediaQuery.of(context).size.height / 23,
            ),
            // Text(
            //   title,
            //   style: const TextStyle(color: Color(0xFFB5B5B5), fontSize: 18),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            Text(
              p1,
              style: const TextStyle(color: Color(0xFFB5B5B5), fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              p2,
              style: const TextStyle(color: Color(0xFFB5B5B5), fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              p3,
              style: const TextStyle(color: Color(0xFFB5B5B5), fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
