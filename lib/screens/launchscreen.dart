import 'package:flutter/material.dart';
import '../Widgets/CaloriFitTitle.dart';
import '../styles/Styles.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child:Container(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/10),
                width: double.infinity,
                child: Column(
                    
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        Flexible(
                            flex: 1,
                            child: Container(),
                            ),
                        const CaloriFitTitle(),
                        SizedBox(height: MediaQuery.of(context).size.height/25),
                        const Text("Not your average calorie counting app", style: onboardingText, textAlign: TextAlign.center,),
                        SizedBox(height: MediaQuery.of(context).size.height/10),
                        InkWell(
                            onTap: () {},
                            child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 18),
                                width: double.infinity,
                                decoration: buttonShapeDecor,
                                child: const Text("Let's get started!", 
                                    textAlign: TextAlign.center, 
                                    style: TextStyle(
                                        color: Colors.black, 
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold
                                        )
                                    )
                            )
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height/15)
                    ],
                ),
            ))
    );
  }
}