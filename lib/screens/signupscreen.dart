import 'dart:io';

import 'package:calori_fit/Widgets/CaloriFitTitle.dart';
import 'package:calori_fit/Widgets/TextInputField.dart';
import 'package:calori_fit/screens/genderscreen.dart';
import 'package:calori_fit/screens/loginscreen.dart';
import 'package:calori_fit/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../resources/auth.dart';
import '../styles/Colors.dart';
import '../models/enums.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordAgainController = TextEditingController();
  final _imagePicker = ImagePicker();
  
  File? profilepic;

  void selectImage() async{
    XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if(image!=null){
      setState(() {
        profilepic = File(image.path);
      });
    }
  }

  @override
  void dispose(){
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordAgainController.dispose();
    _passwordController.dispose();
  }

  void signUpUser() async{
    AuthMethods amo = AuthMethods();
    String result = await amo.registerUser(
      email: _emailController.text,
      name: _nameController.text,
      password: _passwordController.text, 
      age: 0, 
      weight: 0, 
      height: 0, 
      gender: Genders.FEMALE, 
      calorieGoal: 0, 
      profilepic: profilepic!
    ); 
    if(result == 'success'){  
      Navigator.of(context).pop();
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const GenderScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const Image(image: AssetImage("assets/Background2.jpg")),
          Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height/10),
                const Center(child: Text("CaloriFit",
                      style: onboardingSmallText, textAlign: TextAlign.center),
                ),
                Flexible(flex:1, child: Container()),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const LoginScreen())),
                      child: const Text("Login")
                      ),
                    const SizedBox(width: 20,),
                    Column(
                      children: [
                        const Text("Sign Up"),
                        const SizedBox(height: 5,),
                        Container(color: maingreen,width: 50,height: 5,)
                      ],
                    ),
                    Flexible(child: Container(),),
                    Stack(
                      clipBehavior: Clip.antiAlias,
                      children: [
                        profilepic == null?
                        const Image(image: AssetImage("lib/assets/DefaultPP.png"))
                        :
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            //image: ,
                            borderRadius: BorderRadius.circular(50)
                          ),
                          child: Image.file(profilepic!),
                        ),
                        IconButton(
                          onPressed: ()=>  selectImage(),
                          icon: const Icon(Icons.camera_alt_rounded)
                        )
                      ],
                    )
                  ],
                ),
                const Text("Name", textAlign: TextAlign.start,
                    style: TextStyle(color: maingreen)),
                TextInputField( tec: _nameController, tit: TextInputType.text),
                const Text("Email", textAlign: TextAlign.start, style: TextStyle(color: maingreen)),
                TextInputField( tec: _emailController, tit: TextInputType.emailAddress),
                const Text("Password", textAlign: TextAlign.start, style: TextStyle(color: maingreen)),
                TextInputField( tec: _passwordController, tit: TextInputType.text, isPass: true),
                const Text("Re-enter Password", textAlign: TextAlign.start,
                    style: TextStyle(color: maingreen)),
                TextInputField( tec: _passwordAgainController, tit: TextInputType.text, isPass: true,),
                Flexible(flex: 1, child: Container()),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/4),
                  child: InkWell(
                    onTap: signUpUser,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      decoration: buttonShapeDecor,
                      child:  Row(
                        children: const [
                          Text("Sign Up!", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),),
                          SizedBox(width: 5,),
                          Icon(Icons.arrow_right_rounded, color: Colors.black,),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height/10)
              ],
            ),
          )
        ],
      ),
    );
  }
}