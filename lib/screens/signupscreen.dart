import 'package:calori_fit/Widgets/CaloriFitTitle.dart';
import 'package:calori_fit/Widgets/TextInputField.dart';
import 'package:calori_fit/styles/Styles.dart';
import 'package:flutter/material.dart';

import '../styles/Colors.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Image(image: AssetImage("lib/assets/Background3.png")),
          Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height/10),
                const Center(child: CaloriFitTitle(color: Color.fromRGBO(255, 255, 255, 0.5))),
                Flexible(flex:1, child: Container()),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Login"),
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
                      children: const [
                        Image(image: AssetImage("lib/assets/DefaultPP.png")),
                        Icon(Icons.camera_alt_rounded)
                      ],
                    )
                  ],
                ),
                const Text("Name", textAlign: TextAlign.start,),
                TextInputField( tec: _nameController, tit: TextInputType.text),
                const Text("Email", textAlign: TextAlign.start,),
                TextInputField( tec: _emailController, tit: TextInputType.emailAddress),
                const Text("Password", textAlign: TextAlign.start,),
                TextInputField( tec: _passwordController, tit: TextInputType.text, isPass: true),
                const Text("Re-enter Password", textAlign: TextAlign.start,),
                TextInputField( tec: _passwordAgainController, tit: TextInputType.text, isPass: true,),
                Flexible(flex: 1, child: Container()),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/4),
                  child: InkWell(
                    onTap: () {},
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