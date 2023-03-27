import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:calori_fit/Widgets/CaloriFitTitle.dart';
import 'package:calori_fit/Widgets/MealButton.dart';
import 'package:calori_fit/Widgets/SettingsTitle.dart';
// import 'package:calori_fit/screens/processingimage.dart';
import 'package:calori_fit/styles/Colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../resources/classifier.dart';
import '../screens/resultsscreen.dart';

class AddNewMealWidget extends StatefulWidget {
  final String meal;
  final Color color;
  const AddNewMealWidget({super.key, required this.color, required this.meal});

  @override
  State<AddNewMealWidget> createState() => _AddNewMealWidgetState();
}

class _AddNewMealWidgetState extends State<AddNewMealWidget> {
  bool isImgSelected = false;
  File? image;
  bool isLoading = false;
  late Classifier _classifier;
  String? food;

  final ImagePicker _imagePicker = ImagePicker();

  void selectImage() async {
    XFile? im = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (im != null) {
      setState(() {
        image = File(im.path);
      });
      // if (context.mounted) {
      //   Navigator.of(context).push(MaterialPageRoute(
      //       builder: (context) => ProcessingImageScreen(
      //             image: image!,
      //             meal: widget.meal,
      //           )));
      // }
      runInference();
    }
  }

  void runInference() async {
    /// Converting the image to a format that the model can understand.
    img.Image imageInput = img.decodeImage(image!.readAsBytesSync())!;
    _classifier = Classifier();
    await _classifier.loadModel();
    await _classifier.loadLabels();
    var pred = _classifier.predict(imageInput);
    setState(() {
      food = pred;
    });
    // await Future.delayed(const Duration(seconds: 10));
    if (context.mounted) {
      setState(() {
        isLoading = true;
      });
      await Future.delayed(const Duration(seconds: 2));
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ResultScreen(
              image: image!,
              mealType: widget.meal,
              food: food == null ? "" : food!)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: backgroundcolor,
        centerTitle: true,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: 20, horizontal: MediaQuery.of(context).size.width / 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SettingsTitle(text: "Add New Meal"),
            const SizedBox(
              height: 40,
            ),
            Text(
              widget.meal,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'IntegralCF',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            image == null
                ? Image.asset("assets/round.png")
                : Container(child: Image.file(image!)),
            const SizedBox(
              height: 30,
            ),
            Material(
              borderRadius: BorderRadius.circular(5),
              child: GestureDetector(
                onTap: () => selectImage(),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 60,
                  decoration: BoxDecoration(
                      color: maingreen,
                      borderRadius: BorderRadius.circular(32)),
                  alignment: Alignment.center,
                  child: const Text(
                    "Upload Image",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Please upload an image of your meal. Our State-of-the-art AI engine will identify food item(s) based on that.\nIt's just that simple!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                decoration: TextDecoration.none,
                height: 2,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
