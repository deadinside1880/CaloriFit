import 'package:flutter/material.dart';
import './screens/launchscreen.dart';
import 'package:flutter/services.dart';
void main() {
  runApp(MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
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
