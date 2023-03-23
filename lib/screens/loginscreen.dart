import 'package:calori_fit/Widgets/CaloriFitTitle.dart';
import 'package:calori_fit/Widgets/TextInputField.dart';
import 'package:calori_fit/resources/auth.dart';
import 'package:calori_fit/screens/home.dart';
import 'package:calori_fit/screens/signupscreen.dart';
import 'package:calori_fit/styles/Colors.dart';
import 'package:calori_fit/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../resources/providers.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isCorrectEmail = true;
  bool isEmailEmpty = true;
  bool obscurePassword = true;

  @override
  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void login() async{
    AuthMethods amo = AuthMethods();
    String res = await amo.signInUser(email: _emailController.text, password: _passwordController.text);
    if(res == 'success' && context.mounted){
      context.read<Providers>().refreshUser();
      print("refresged user");
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Home()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const Image(image: AssetImage("lib/assets/Background3.png")),
          Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height/10,),
                const Center(child: CaloriFitTitle(color: Colors.white)),
                Flexible(flex:1,child: Container(),),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        const Text("Log in"),
                        const SizedBox(height: 5),
                        Container(color: maingreen, width: 50, height: 5,)
                      ],
                    ),
                    const SizedBox(width: 20,),
                    InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUpScreen())),
                      child: const Text("Sign Up")
                      )
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height/10,),
                const Text("Welcome back", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900, color: Colors.white),),
                const SizedBox(height: 20,),
                const Text("Log in to your account", style: TextStyle(fontSize: 20, color: Colors.white),),
                SizedBox(height: MediaQuery.of(context).size.height/10,),
                const Text("Email", style: TextStyle(color: maingreen),),
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    TextInputField(tec: _emailController, tit: TextInputType.emailAddress),
                    Visibility(
                      visible: isCorrectEmail,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: 30,
                        width: 30,
                        alignment: Alignment.topRight,
                        decoration: ShapeDecoration(
                          color: maingreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4))
                            ),
                        child: const Center(child: Icon(Icons.check_sharp, color: Colors.black,)),
                      ),  
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                const Text("Password", style: TextStyle(color: maingreen)),
                const SizedBox(height: 5,),
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    TextInputField(tec: _passwordController, tit: TextInputType.text, isPass: obscurePassword,),
                    InkWell(
                      onTap: () => setState(() {
                        obscurePassword = !obscurePassword;
                      }),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: 30,
                        width: 30,
                        alignment: Alignment.topRight,
                        child: const Icon(Icons.remove_red_eye_rounded),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10,),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {},
                    child: const Text("Forgot Password", style: TextStyle(color: maingreen),),
                  )
                ),
                Flexible(flex: 1, child: Container()),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/4 - 5),
                  child: InkWell(
                    onTap: login,
                    child: Container(
                      decoration: buttonShapeDecor,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      child: Row(
                        children: const [
                           Text("Login", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),),
                           Icon(Icons.arrow_right_rounded, color: Colors.black,)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 10,)
              ],
            ),
          )
        ],
      ),
    );
  }
}