import 'package:calori_fit/Widgets/CaloriFitTitle.dart';
import 'package:calori_fit/Widgets/InfoSelectionBottom.dart';
import 'package:calori_fit/models/enums.dart';
import 'package:calori_fit/screens/agescreen.dart';
import 'package:calori_fit/screens/signupscreen.dart';
import 'package:calori_fit/styles/Colors.dart';
import 'package:flutter/material.dart';


class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  Genders _gender = Genders.FEMALE;
  bool isMaleSelected = false;
  bool isFemaleSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/10),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height/10,),
            const CaloriFitTitle(color: Colors.white),
            SizedBox(height: MediaQuery.of(context).size.height/10,),
            const Text("TELL US ABOUT YOURSELF!", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),),
            const SizedBox(height: 15,),
            const Text("TO GIVE YOU A BETTER EXPERIENCE WE NEED"),
            const SizedBox(height: 10,),
            const Text("TO KNOW YOUR GENDER"),
            SizedBox(height:MediaQuery.of(context).size.height/15,),
            GestureDetector(
              onTap: () => setState(() {
                isFemaleSelected = false;
                isMaleSelected = true;
                _gender = Genders.MALE;
              }),
              child:
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: isMaleSelected?165: 150,
                  width: isMaleSelected?165: 150,
                  decoration: BoxDecoration(
                    color: isMaleSelected?maingreen: grey,
                    borderRadius: BorderRadius.circular(isMaleSelected?82.5 : 75),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.male_rounded, color: isMaleSelected?  Colors.black: Colors.white, size: 75,),
                      const SizedBox(height: 15,),
                      Text("Male", style: TextStyle(color: isMaleSelected? Colors.black: Colors.white),)
                    ],
                  ),
                ),
            ),
            const SizedBox(height: 50,),
            GestureDetector(
              onTap: () => setState(() {
                isMaleSelected = false;
                isFemaleSelected = true;
              }),
              child:
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: isFemaleSelected?165: 150,
                  width: isFemaleSelected?165: 150,
                  decoration: BoxDecoration(
                    color: isFemaleSelected?maingreen: grey,
                    borderRadius: BorderRadius.circular(isFemaleSelected?82.5 : 75),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.female_rounded, color: isFemaleSelected?  Colors.black: Colors.white, size: 75,),
                      const SizedBox(height: 15,),
                      Text("Female", style: TextStyle(color: isFemaleSelected? Colors.black: Colors.white),)
                    ],
                  ),
                ),
            ),
            Flexible(flex: 1, child: Container()),
            InfoSelectionBottom(Screen: 'GENDERSCREEN', nextScreen: const AgeSelectorScreen(), gender: _gender,),
            Flexible(flex: 1, child: Container()),
          ],
        ),
      ),
    );
  }
}