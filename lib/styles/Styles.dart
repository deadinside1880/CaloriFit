import 'package:calori_fit/screens/homescreen.dart';
import 'package:calori_fit/screens/profilescreen.dart';
import 'package:flutter/material.dart';
import './Colors.dart';

const onboardingText = TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: Colors.white);

const buttonShapeDecor = ShapeDecoration(color: maingreen, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(48))));

const homescreens = [HomeScreen(), Text("Stats"), Text("Notifications"), ProfileScreen()];
