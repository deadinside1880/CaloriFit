import 'package:calori_fit/Widgets/PaintedArc.dart';
import 'package:calori_fit/Widgets/ProfileScreenOption.dart';
import 'package:calori_fit/resources/auth.dart';
import 'package:calori_fit/screens/editprofilescreen.dart';
import 'package:calori_fit/screens/loginscreen.dart';
import 'package:calori_fit/screens/mainsettings.dart';
import 'package:calori_fit/screens/onboarding.dart';
import 'package:calori_fit/screens/privacypolicyscreen.dart';
import 'package:calori_fit/styles/Colors.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final String _firstName = "SARAH";
  final String _lastName = "WEGAN";

  void signOut(){
    AuthMethods amo = AuthMethods();
    amo.signOut();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const OnboardingScreen()));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height/20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                alignment: Alignment.center,
                children: const [
                  CustomPaint(
                    size: Size(100,100),
                    painter: GradientArcPainter(
                      progress: 0.75, 
                      startColor: maingreen, 
                      endColor: Color(0xFFFF798E), 
                      width: 5
                    )
                  ),
                  Icon(Icons.person, size: 50,)
                ],
              ),
              Container(
                height: 100,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  border: Border(left: BorderSide( width: 1, color: grey))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Joined", style: TextStyle(color: lightgrey, fontSize: 18),),
                    SizedBox(height: 10,),
                    Text("2 months ago", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),)
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 20,),
          Text(_firstName, style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w900),),
          const SizedBox(height: 10,),
          Text(_lastName, style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w700),),
          const SizedBox(height: 20,),
          ProfileScreenOption(
            onPress: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EditProfileScreen())) , 
            text: "Edit Profile",
            isLastOption: false,
          ),
          ProfileScreenOption(
            onPress: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen())), 
            text: "Privacy Policy", 
            isLastOption: false,),
          ProfileScreenOption(
            onPress: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MainSettings())), 
            text: "Settings", 
            isLastOption: true,
          ),
          Flexible(flex: 1, child: Container()),
          GestureDetector(
            onTap: signOut,
            child: const Text("Sign Out", style: TextStyle(color: Colors.red, fontSize: 20),),
          ),
          const SizedBox(height: 30,)
        ],
      ),
    );
  }
}