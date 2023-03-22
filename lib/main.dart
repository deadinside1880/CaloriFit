import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './screens/launchscreen.dart';
import 'package:flutter/services.dart';
void main() async{
  runApp(MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromRGBO(28, 16, 24, 1)
      ),
      home: LaunchScreen()
    );
  }
}
