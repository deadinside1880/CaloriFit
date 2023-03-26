import 'dart:io';
import 'package:calori_fit/resources/classifier.dart';
import 'package:image/image.dart' as img;
import 'package:calori_fit/Widgets/SettingsTitle.dart';
import 'package:calori_fit/models/Meal.dart';
import 'package:calori_fit/models/enums.dart';
import 'package:calori_fit/screens/resultsscreen.dart';
import 'package:calori_fit/styles/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

class ProcessingImageScreen extends StatefulWidget {
  const ProcessingImageScreen({super.key, required this.image, required this.meal});
  final File image;
  final String meal;
  @override
  State<ProcessingImageScreen> createState() => _ProcessingImageScreenState();
}

class _ProcessingImageScreenState extends State<ProcessingImageScreen> {

  late Classifier _classifier;
  Category? category;

  @override
  void initState(){
    super.initState();
  }

  void runInference()async{
    img.Image imageInput = img.decodeImage(widget.image.readAsBytesSync())!;
    _classifier = Classifier();
    await _classifier.loadModel();
    await _classifier.loadLabels();
    print("done with basic bitch shit");
    var pred = _classifier.predict(imageInput);
    setState(() {
      category = pred;
    });
    if(category!=null){
      print(category!.score);
      print(category!.label);
    }
  }

  @override
  Widget build(BuildContext context) {
    runInference();
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/20),
        child: Column(
          children: [
            SizedBox(height:MediaQuery.of(context).size.height/20 ,),
            SettingsTitle(text: widget.meal),
            const SizedBox(height: 20,),
            Container(
              clipBehavior: Clip.antiAlias,
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
              ),
              child: Image.file(widget.image),
            ),
            const SizedBox(height: 20,),
            const Text("Your photo is being processed!", style: TextStyle(),),
            const SizedBox(height: 15,),
            const Text("Please check back again later!"),
            const SizedBox(height: 30,),
            GestureDetector(
              onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(
                builder: (context)=> ResultScreen(
                  meal: widget.meal, 
                  foods: [Meal(MealType.BREAKFAST, 900, "Pizza")]
                )
                )),
              child: Container(
                clipBehavior: Clip.antiAlias,
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 60),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: maingreen
                ),
                child: const Text(
                  "Refresh Status", 
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 20
                  ),  
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}