import 'dart:io';

import 'package:calori_fit/Widgets/CaloriFitTitle.dart';
import 'package:calori_fit/Widgets/TextInputField.dart';
import 'package:calori_fit/resources/providers.dart';
import 'package:calori_fit/screens/genderscreen.dart';
import 'package:calori_fit/screens/loginscreen.dart';
import 'package:calori_fit/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
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
  String error = "";
  bool isError= false;
  bool isEmailValid = false;

  void selectImage() async {
    XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        profilepic = File(image.path);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordAgainController.addListener(password2);
    _emailController.addListener(typeEmail);
  }

  void typeEmail(){
    setState(() {
      if(RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(_emailController.text)){
            isEmailValid=true;
          }else{
            isEmailValid = false;
          }
    });
  }

  void password2(){
    setState(() {
      if(_passwordAgainController.text != _passwordController.text){
        isError = true;
        error="Passwords do not match";
      }else{
        isError = false;
        error = "";
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordAgainController.dispose();
    _passwordController.dispose();
  }

  bool checkError(){
    setState(() {
      isError = false;
      if(_emailController.text.isEmpty){
        error="Please Enter email address";
        isError = true;
      }else if(_passwordController.text.isEmpty){
        error = "Please Enter Password";
        isError = true;
      }else if(_passwordController.text.length < 6){
        error="Password should be more than 6 characters";
        isError = true;
      }else if(profilepic==null){
        error ="Please upload a picture";
        isError=true;
      }else if(_nameController.text.isEmpty){
        error = "Please enter a name";
        isError = true;
      }else if(!isEmailValid){
        error = "Please enter a valid email";
        isError = true;
      }
    });
    return isError;
  }

  void signUpUser() async {
    if(checkError()){return;}
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
        profilepic: profilepic!);
    if (result == 'success' && context.mounted) {
      context.read<Providers>().refreshUser();
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
        builder: (context) => const GenderScreen()), 
        (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const Image(image: AssetImage("assets/Background3.png")),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: MediaQuery.of(context).size.height / 10),
                const SizedBox(height: 75),
                // const Center(
                //     child: CaloriFitTitle(
                //         color: Color.fromRGBO(255, 255, 255, 0.5))),
                const Center(
                  child: Text(
                    "CaloriFit",
                    style: onboardingSmallText,
                    textAlign: TextAlign.center,
                  ),
                ),
                // Flexible(flex:1, child: Container()),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 8,
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen())),
                        child: const Text("Log in")),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        const Text("Sign Up"),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          color: maingreen,
                          width: 50,
                          height: 5,
                        )
                      ],
                    ),
                    Flexible(
                      child: Container(),
                    ),
                    Stack(
                      clipBehavior: Clip.antiAlias,
                      children: [
                        profilepic == null
                            ? const Image(
                                image: AssetImage("assets/DefaultPP.png"))
                            : CircleAvatar(
                                backgroundImage: FileImage(profilepic!),
                          radius: 50,
                              ),
                        IconButton(
                            onPressed: () => selectImage(),
                            icon: const Icon(Icons.camera_alt_rounded))
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),

                const Text(
                  "Name",
                  textAlign: TextAlign.start,
                  style: TextStyle(color: maingreen),
                ),
                TextInputField(tec: _nameController, tit: TextInputType.text),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Email",
                  textAlign: TextAlign.start,
                  style: TextStyle(color: maingreen),
                ),
                TextInputField(
                    tec: _emailController, tit: TextInputType.emailAddress),
                const SizedBox(
                  height: 10,
                ),

                const Text(
                  "Password",
                  textAlign: TextAlign.start,
                  style: TextStyle(color: maingreen),
                ),
                TextInputField(
                    tec: _passwordController,
                    tit: TextInputType.text,
                    isPass: true),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Re-enter Password",
                  textAlign: TextAlign.start,
                  style: TextStyle(color: maingreen),
                ),
                TextInputField(
                  tec: _passwordAgainController,
                  tit: TextInputType.text,
                  isPass: true,
                ),
                const SizedBox(height: 10,),
                Visibility(
                  visible: isError,
                  child: Text(error, style: const TextStyle(color: Colors.red),)
                ),
                Flexible(flex: 1, child: Container()),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 4),
                  child: GestureDetector(
                    onTap: signUpUser,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      decoration: buttonShapeDecor,
                      child: Row(
                        children: const [
                          Text(
                            "Sign Up!",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.arrow_right_rounded,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 10)
              ],
            ),
          )
        ],
      ),
    );
  }
}
