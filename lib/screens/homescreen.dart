import 'package:calori_fit/Widgets/CaloriFitTitle.dart';
import 'package:calori_fit/styles/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool _isfirstWidget = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: backgroundcolor,
        title: const CaloriFitTitle(color: Colors.white),
        centerTitle: true,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/20),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Good Morning!", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),),
                    SizedBox(height: 10,),
                    Text("Monday, February 07, 2023")
                  ],
                ),
                Flexible(child: Container()),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(Icons.sunny,color: Colors.yellow,),
                    Text("28C"),
                    Text("Singapore")
                  ],
                )
              ],
            ),
            AnimatedContainer(
              duration: const Duration(seconds: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    child: GestureDetector(
                      onHorizontalDragEnd: (details) {
                        setState(() {
                          _isfirstWidget = !_isfirstWidget;
                        });
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        height: 5, 
                        width: _isfirstWidget? 40:15, 
                        color: _isfirstWidget? maingreen : grey,
                      ),
                      const SizedBox(width: 10,),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        height: 5, 
                        width: !_isfirstWidget? 40:15, 
                        color: !_isfirstWidget? maingreen : grey,
                      ),
                    ],
                  )
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}