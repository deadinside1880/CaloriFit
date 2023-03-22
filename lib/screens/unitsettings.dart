import 'package:calori_fit/Widgets/SettingScreen.dart';
import 'package:flutter/material.dart';

import '../styles/Colors.dart';
class UnitSettingsScreen extends StatefulWidget {
  const UnitSettingsScreen({super.key});

  @override
  State<UnitSettingsScreen> createState() => _UnitSettingsScreenState();
}

class _UnitSettingsScreenState extends State<UnitSettingsScreen> {

  bool _iskCal = true;

  @override
  Widget build(BuildContext context) {
    return SettingsScreen(
      title: "UNITS OF MEASURE", 
      widgets: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          width: MediaQuery.of(context).size.width*.8,
          decoration: const  BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 2,
                color: grey
              ),
            )
          ),
          child: GestureDetector(
            onTap: () => setState(() {
                _iskCal = true;
            }),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                const Text("kCal", style: TextStyle(fontSize: 18),),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedContainer(
                      height: 20,
                      width: 20,
                      duration: const Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _iskCal? Colors.transparent : const Color(0xFF3A3A3C)
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: _iskCal? const Color(0xFF69EBD0) : Colors.transparent
                      ),
                    ),
                    AnimatedContainer(
                      height: 10,
                      width: 10,
                      duration: const Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: _iskCal? const Color(0xFF302756) : Colors.transparent
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),

        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          width: MediaQuery.of(context).size.width*.8,
          decoration: const  BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 2,
                color: grey
              ),
              bottom: BorderSide(
                width: 2,
                color: grey
              )
            )
          ),
          child: GestureDetector(
            onTap: () => setState(() {
                _iskCal = false;
            }),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                const Text("kJ", style: TextStyle(fontSize: 18),),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedContainer(
                      height: 20,
                      width: 20,
                      duration: const Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _iskCal? const Color(0xFF3A3A3C) : Colors.transparent
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: _iskCal? Colors.transparent : const Color(0xFF69EBD0)
                      ),
                    ),
                    AnimatedContainer(
                      height: 10,
                      width: 10,
                      duration: const Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: _iskCal? Colors.transparent : const Color(0xFF302756)
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ]
    );
  }
}