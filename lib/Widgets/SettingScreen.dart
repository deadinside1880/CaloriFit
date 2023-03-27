import 'package:calori_fit/Widgets/CaloriFitTitle.dart';
import 'package:calori_fit/Widgets/ProfileScreenOption.dart';
import 'package:calori_fit/Widgets/SettingsTitle.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {

  final String title;
  final List<Widget> widgets;

  const SettingsScreen({
    super.key,
    required this.title,
    required this.widgets
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/20, vertical: MediaQuery.of(context).size.height/40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // const CaloriFitTitle(color: Colors.white),
            SizedBox(height: MediaQuery.of(context).size.height/20),
            SettingsTitle(text: title),
            SizedBox(height: MediaQuery.of(context).size.height/10),
            ...widgets
          ],
        )
      ),
    );
  }
}