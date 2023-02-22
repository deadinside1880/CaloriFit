import 'package:calori_fit/styles/Colors.dart';
import 'package:calori_fit/styles/Styles.dart';
import 'package:flutter/material.dart';


class InfoSelectionBottom extends StatelessWidget {
  final bool isGenderScreen;
  final Widget nextScreen;
  const InfoSelectionBottom({super.key, required this.isGenderScreen, required this.nextScreen});

  @override
  Widget build(BuildContext context) {
    return Container(
              width: double.infinity,
              child: Row(
                children: [
                  isGenderScreen? 
                  Container():
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: grey,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Icon(Icons.keyboard_arrow_left_sharp, color: Colors.white,),
                    ),
                  ),
                  Flexible(child: Container()),

                  InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => nextScreen)),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      decoration: buttonShapeDecor,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text("Next", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),),
                          Icon(Icons.arrow_right_rounded, color: Colors.black, size: 35,)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
  }
}