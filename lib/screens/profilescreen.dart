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
import 'package:provider/provider.dart';

import '../resources/providers.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  String _firstName = "SARAH";
  String _lastName = "WEGAN";

  void signOut(){
    AuthMethods amo = AuthMethods();
    amo.signOut();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const OnboardingScreen()));
    Navigator.of(context).pop();
  }

  void getName(){
    String fullname = context.read<Providers>().getUser.name;
    int idx = fullname.indexOf(" ");
    setState(() {
      if(idx>0){
        _firstName = fullname.substring(0,idx);
        _lastName = fullname.substring(idx+1);
      }else{
        _firstName = fullname;
        _lastName = "";
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    getName();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.08),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height/20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  const CustomPaint(
                    size: Size(130,130),
                    painter: GradientArcPainter(
                      progress: 0.75, 
                      startColor: maingreen, 
                      endColor: Color(0xFFFF798E), 
                      width: 5
                    )
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(context.read<Providers>().getUser.photoURL),
                    radius: 50,
                    ),
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
          Text(_lastName, style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w900),),
          const SizedBox(height: 50,),
          ProfileScreenOption(
            onPress: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EditProfileScreen())) , 
            text: "Edit Profile",
            isLastOption: false,
          ),
          const SizedBox(
            height: 10,
          ),
          ProfileScreenOption(
            onPress: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen())), 
            text: "About Us", 
            isLastOption: false,),
          const SizedBox(
            height: 10,
          ),
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
          const SizedBox(height: 50,)
        ],
      ),
    );
  }
}