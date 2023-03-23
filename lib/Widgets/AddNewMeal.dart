import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:calori_fit/Widgets/CaloriFitTitle.dart';
import 'package:calori_fit/Widgets/MealButton.dart';
import 'package:calori_fit/Widgets/SettingsTitle.dart';
import 'package:calori_fit/styles/Colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddNewMealWidget extends StatefulWidget {
  final String meal;
  final Color color;
  const AddNewMealWidget({
    super.key,
    required this.color,
    required this.meal
    });

  @override
  State<AddNewMealWidget> createState() => _AddNewMealWidgetState();
}

class _AddNewMealWidgetState extends State<AddNewMealWidget> {

  bool isImgSelected = false;
  File? image;
  final ImagePicker _imagePicker = ImagePicker();

  void selectImage() async{
    XFile? im = await _imagePicker.pickImage(source: ImageSource.gallery);
    if(im != null){
      setState(() {
        image = File(im.path);
      });
    }
  }

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
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: MediaQuery.of(context).size.width/10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SettingsTitle(text: "Add New Meal"),
            const SizedBox(height: 30,),
            Material(child: MealButton(meal: widget.meal, color: widget.color, dosumn: (){})),
            const SizedBox(height: 15,),
            image==null? 
            const Image(image: NetworkImage("https://images7.alphacoders.com/129/1297416.png"))
            :
            Container(
              height: 300,
              width: 300,
              child: Image.file(image!)
              ),
            const SizedBox(height: 10,),
            Material(
              borderRadius: BorderRadius.circular(5),
              child: InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: () => selectImage(),
                child: Container(
                  width: MediaQuery.of(context).size.width*0.7,
                  height: 40,
                  decoration: BoxDecoration(
                    color: maingreen,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  alignment: Alignment.center,
                  child: const Text("Upload Image", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            const Text("Please upload an image of your meal. Our State-of-the-art AI engine will identify food items based on that. It's just that simple!",
              style: TextStyle(color: Colors.white, fontSize: 18, decoration: TextDecoration.none, height: 1.5),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}