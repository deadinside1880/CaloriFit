import 'package:calori_fit/Widgets/CaloriFitTitle.dart';
import 'package:calori_fit/Widgets/SettingsTitle.dart';
import 'package:calori_fit/Widgets/TextInputField.dart';
import 'package:flutter/material.dart';

import '../styles/Colors.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/20, vertical: MediaQuery.of(context).size.height/40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CaloriFitTitle(color: Colors.white),
            SizedBox(height: MediaQuery.of(context).size.height/40,),
            const SettingsTitle(text: "EDIT PROFILE"),
            SizedBox(height: MediaQuery.of(context).size.height/20,),
            Stack(
              clipBehavior: Clip.none,
              children:[
                const CircleAvatar(
                  radius: 64,
                  backgroundImage: NetworkImage("https://cdn.anime-planet.com/characters/primary/mahiru-shiina-1-285x399.webp?t=1674248740")
                ),
                Positioned(
                  right: -20,
                  bottom: 0,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: grey,
                      borderRadius: BorderRadius.circular(25)
                    ),
                    child: IconButton(
                      onPressed: () {}, 
                      icon: const Icon(Icons.camera_alt_rounded)
                      ),
                  )
                  )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height/10,),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 5),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(width: 1, color: grey),)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Name", style: TextStyle(color: maingreen),),
                  TextInputField(tec: _nameController, tit: TextInputType.name, hintText: "Name",)
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 5),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(width: 1, color: grey), bottom: BorderSide(width: 1, color: grey))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Email", style: TextStyle(color: maingreen),),
                  TextInputField(tec: _emailController, tit: TextInputType.emailAddress, hintText: "Email",)
                ],
              ),
            ),
            Flexible(flex: 1, child: Container()),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.3, vertical: 15),
                decoration: BoxDecoration(
                  color: maingreen,
                  borderRadius: BorderRadius.circular(28)
                ),
                child: const Text("Save", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),),
              ),
            ),
            const SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}