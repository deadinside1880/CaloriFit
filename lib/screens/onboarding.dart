import 'package:calori_fit/Widgets/CaloriFitTitle.dart';
import 'package:calori_fit/screens/loginscreen.dart';
import 'package:calori_fit/screens/signupscreen.dart';
import 'package:calori_fit/styles/Colors.dart';
import 'package:calori_fit/styles/Styles.dart';
import 'package:flutter/material.dart';

import '../Widgets/CaloriFitTitleSmall.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isEmailEmpty = true;
  bool isEmailValid = true;
  AssetImage image = const AssetImage('assets/bg1.png');
  String imgp = 'assets/bg1.png';
  bool state = false;
  String txt = 'ACTION IS THE KEY TO ALL SUCCESS';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            AnimatedSwitcher(
              duration: const Duration(seconds: 5),
              child: ShaderMask(
                shaderCallback: (rect) {
                  return const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topLeft,
                    colors: [Colors.transparent, Color.fromRGBO(28, 16, 24, 1)],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: Image.asset(
                  imgp,
                  // height: 400,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            // Image(
            //     image: image, width: MediaQuery.of(context).size.width)),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 10),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(height: MediaQuery.of(context).size.width / 10),
                  const SizedBox(height: 75),
                  const CaloriFitSmallTitle(color: Colors.white),
                  Flexible(flex: 1, child: Container()),
                  Text(txt, style: onboardingText, textAlign: TextAlign.center),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        color: state
                            ? const Color.fromRGBO(58, 58, 60, 1)
                            : maingreen,
                        width: state ? 20 : 40,
                        height: 5,
                      ),
                      const SizedBox(width: 10),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        color: state
                            ? maingreen
                            : const Color.fromRGBO(58, 58, 60, 1),
                        width: state ? 40 : 20,
                        height: 5,
                      )
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 15),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 4 - 10),
                    child: GestureDetector(
                      onTap: () {
                        if (state) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                        } else {
                          setState(() {
                            state = true;
                            image = const AssetImage('assets/bg2.png');
                            imgp = 'assets/bg2.png';
                            txt = 'Progress starts with taking action.';
                            return;
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        width: double.infinity,
                        decoration: buttonShapeDecor,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text("Next",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center),
                              Icon(
                                Icons.arrow_right_rounded,
                                color: Colors.black,
                              )
                            ]),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Have an account?",
                        style: TextStyle(fontSize: 17),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          if (state) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                          }
                        },
                        child: const Text("Log in",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 17)),
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
