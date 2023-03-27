import 'package:calori_fit/Widgets/CaloriFitTitle.dart';
import 'package:calori_fit/screens/loginscreen.dart';
import 'package:calori_fit/screens/signupscreen.dart';
import 'package:calori_fit/styles/Colors.dart';
import 'package:calori_fit/styles/Styles.dart';
import 'package:flutter/material.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isEmailEmpty = true;
  bool isEmailValid = true;

  Image image = const Image(image: AssetImage('assets/Background.jpg'));
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Stack(
            children: [
              const Image(image: AssetImage('lib/assets/Background.png')),
              Container(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/10),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.width/10),
                  const Text("CaloriFit",
                      style: onboardingSmallText, textAlign: TextAlign.center),
                    // const CaloriFitTitle(color: Colors.white),
                    Flexible(flex: 1, child: Container()),
                    const Text("ACTION IS THE", style: onboardingSmallText, textAlign: TextAlign.center),
                    const SizedBox(height: 10),
                  const Text("KEY TO ALL SUCCESS",
                      style: onboardingSmallText, textAlign: TextAlign.center),
                    // const Text("KEY TO ALL SUCCESS", 
                    //         style: TextStyle(
                    //           fontWeight: FontWeight.w800, 
                    //           fontSize: 32, 
                    //           color: Colors.white), 
                    //         textAlign: TextAlign.center
                    //       ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(color: maingreen,width: 40,height: 5,),
                        const SizedBox(width: 10),
                        Container(color: const Color.fromRGBO(58, 58, 60, 1), width: 20,height: 5,)
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/15),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/4 -10),
                      child: GestureDetector(
                        onTap: () {
                          if(state){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const SignUpScreen()));
                          }else{
                            setState(() {
                              state = true;
                              image = const Image(image: AssetImage('assets/Background2.jpg'));
                              return;
                            });
                          }
                        },
                        child: Container(
                          
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          width: double.infinity,
                          decoration: buttonShapeDecor,
                          child: Row (
                            mainAxisAlignment: MainAxisAlignment.center,
                            children : const [
                              Text("Next",
                                style: TextStyle(
                                  fontSize: 20, 
                                  color: Colors.black, 
                                  fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center
                              ),
                              Icon(Icons.arrow_right_rounded, color: Colors.black,)
                                ]
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Have an account?", style: TextStyle(fontSize: 17),),
                        const SizedBox(width: 5),
                        InkWell(
                          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen())),
                          child: const Text("Log in", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17)),
                        )
                      ],
                    ),
                    const SizedBox(height: 10)
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }
}