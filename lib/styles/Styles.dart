import 'package:calori_fit/screens/achievementscreen.dart';
import 'package:calori_fit/screens/homescreen.dart';
import 'package:calori_fit/screens/profilescreen.dart';
import 'package:flutter/material.dart';
import './Colors.dart';

const onboardingText =
    TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: Colors.white, fontFamily: 'IntegralCF');
const onboardingSmallText =
    TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white, fontFamily: 'IntegralCF');

const buttonShapeDecor = ShapeDecoration(color: maingreen, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(48))));

const String firegif = "https://media.tenor.com/FLSfdrF_AhsAAAAC/blue-fire-calatop-blue-fire.gif";

const errors = {
  'email-already-exists' : 'This email is already in use',
  'invalid-email' : 'This email is invalid',
  'user-not-found' : 'This email address has not been registered'
};

//https://media4.giphy.com/media/JoV6rEAzVhWwjx2yCL/200w.gif?cid=6c09b952lc6harzoj3v2c1untdiau23re0d3badly13lium6&rid=200w.gif&ct=g