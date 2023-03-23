import 'package:calori_fit/models/User.dart';
import 'package:calori_fit/models/enums.dart';
import 'package:calori_fit/resources/auth.dart';
import 'package:calori_fit/resources/providers.dart';
import 'package:calori_fit/styles/Colors.dart';
import 'package:calori_fit/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class InfoSelectionBottom extends StatelessWidget {
  final String Screen;
  final Widget nextScreen;
  final int age;
  final int weight;
  final int height;
  final int calorieGoal;
  final Genders gender;
  const InfoSelectionBottom({
    super.key, 
    required this.Screen, 
    required this.nextScreen,
    this.age = 0,
    this.calorieGoal = 0,
    this.gender = Genders.FEMALE,
    this.height = 0,
    this.weight = 0
    });

  @override
  Widget build(BuildContext context) {
    return Container(
              width: double.infinity,
              child: Row(
                children: [
                  Screen == 'GENDERSCREEN'? 
                  Container():
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: grey,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Icon(Icons.keyboard_arrow_left_sharp, color: Colors.white,),
                    ),
                  ),
                  Flexible(child: Container()),

                  InkWell(
                    onTap: () {
                      switch(Screen){
                        case 'GENDERSCREEN':{context.read<Providers>().setGender = gender;}
                          break;
                        case 'AGESCREEN':{context.read<Providers>().setAge = age;}
                          break;
                        case 'HEIGHTSCREEN':{context.read<Providers>().setHeight = height;}
                          break;
                        case 'WEIGHTSCREEN':{context.read<Providers>().setWeight = weight;}
                          break;
                        case 'CALORIESCREEN':{
                          context.read<Providers>().setCalorieGoal = calorieGoal;
                          AuthMethods _amo = AuthMethods();
                          User _user = context.read<Providers>().getUser;
                          _amo.updateUser(_user);
                          context.read<Providers>().refreshUser();
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => nextScreen));
                          return;
                          }
                      }
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => nextScreen));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      decoration: buttonShapeDecor,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text("Next", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),),
                          Icon(Icons.arrow_right_rounded, color: Colors.black, size: 35,)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
  }
}