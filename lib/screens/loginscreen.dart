import 'package:calori_fit/Widgets/CaloriFitTitle.dart';
import 'package:calori_fit/Widgets/Loader.dart';
import 'package:calori_fit/Widgets/TextInputField.dart';
import 'package:calori_fit/resources/auth.dart';
import 'package:calori_fit/screens/home.dart';
import 'package:calori_fit/screens/signupscreen.dart';
import 'package:calori_fit/styles/Colors.dart';
import 'package:calori_fit/styles/Styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  bool isLoading = false;
  bool isEmailWrong = false;
  bool isPasswordWrong = false;
  String emailError = "";
  String passwordError = "";

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_onKeyPressed);
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void _onKeyPressed() {
    setState(() {
      if (_emailController.text.isEmpty) {
        isEmailEmpty = true;
      } else {
        isEmailEmpty = false;
      }
      if (RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(_emailController.text)) {
        isCorrectEmail = true;
      } else {
        isCorrectEmail = false;
      }
    });
  }

  void login() async {
    AuthMethods amo = AuthMethods();
    String res = await amo.signInUser(
        email: _emailController.text, password: _passwordController.text, authInstance: FirebaseAuth.instance);
    if (res == 'success' && context.mounted) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
        builder: (context) => const Home()), 
        (Route<dynamic> route) => false);
    }else{
      parseError(res);
    }
  }

  void parseError(String res){
      setState(() {
        passwordError = errors[res]!;
        isPasswordWrong = true;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: isLoading
          ? const Loader()
          : Stack(
              children: [
                // const Image(image: AssetImage("assets/bg2.png")),
                ShaderMask(
                  shaderCallback: (rect) {
                    return const LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topLeft,
                      colors: [
                        Colors.transparent,
                        Color.fromRGBO(28, 16, 24, 1)
                      ],
                    ).createShader(
                        Rect.fromLTRB(0, 0, rect.width, rect.height));
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.asset(
                    'assets/bg3.png',
                    // height: 400,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(height: MediaQuery.of(context).size.height/10,),
                      const SizedBox(height: 75),

                      // const Center(child: CaloriFitTitle(color: Colors.white)),
                      const Center(
                        child: Text(
                          "CaloriFit",
                          style: onboardingSmallText,
                          textAlign: TextAlign.center,
                        ),
                      ),

                      // Flexible(flex:1,child: Container(),),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 8,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              const Text("Log in"),
                              const SizedBox(height: 5),
                              Container(
                                color: maingreen,
                                width: 50,
                                height: 5,
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpScreen())),
                              child: const Text("Sign Up"))
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        "Welcome back",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Log in to your account",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      const Text(
                        "Email",
                        style: TextStyle(color: maingreen),
                      ),
                      Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          TextInputField(
                              tec: _emailController,
                              tit: TextInputType.emailAddress),
                          Visibility(
                            visible: isCorrectEmail && !isEmailEmpty,
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 30,
                              width: 30,
                              alignment: Alignment.topRight,
                              decoration: ShapeDecoration(
                                  color: maingreen,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4))),
                              child: const Center(
                                  child: Icon(
                                Icons.check_sharp,
                                color: Colors.black,
                              )),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("Password",
                          style: TextStyle(color: maingreen)),
                      const SizedBox(
                        height: 5,
                      ),
                      Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          TextInputField(
                            tec: _passwordController,
                            tit: TextInputType.text,
                            isPass: obscurePassword,
                          ),
                          GestureDetector(
                            onTap: () => setState(() {
                              obscurePassword = !obscurePassword;
                            }),
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 30,
                              width: 30,
                              alignment: Alignment.topRight,
                              child: const Icon(Icons.remove_red_eye_rounded),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Visibility(
                        visible: isPasswordWrong,
                        child: Text(passwordError, style: const TextStyle(color: Colors.red),)),
                      const SizedBox(
                        height: 10,
                      ),
                      Visibility(
                          visible: isPasswordWrong, child: Text(passwordError, style: const TextStyle(color: Colors.red),)),
                      const SizedBox(
                        height: 10,
                      ),
                      // Container(
                      //     width: double.infinity,
                      //     alignment: Alignment.centerRight,
                      //     child: GestureDetector(
                      //       onTap: () {},
                      //       child: const Text(
                      //         "Forgot Password",
                      //         style: TextStyle(color: maingreen),
                      //       ),
                      //     )),
                      Flexible(flex: 1, child: Container()),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width / 4 - 5),
                        child: GestureDetector(
                          onTap: login,
                          child: Container(
                            decoration: buttonShapeDecor,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Icon(
                                  Icons.arrow_right_rounded,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 10,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
