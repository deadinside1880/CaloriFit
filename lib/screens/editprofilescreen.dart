import 'dart:io';

import 'package:calori_fit/Widgets/CaloriFitTitle.dart';
import 'package:calori_fit/Widgets/Loader.dart';
import 'package:calori_fit/Widgets/SettingsTitle.dart';
import 'package:calori_fit/Widgets/TextInputField.dart';
import 'package:calori_fit/resources/auth.dart';
import 'package:calori_fit/resources/store.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../resources/providers.dart';
import '../styles/Colors.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final _imagePicker = ImagePicker();

  File? profilepic;
  bool isLoading = false;

  void selectImage() async{
    XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if(image!=null){
      setState(() {
        profilepic = File(image.path);
      });
    }
  }

  void update() async{
    setState(() {
      isLoading = true;
    });
    FireStore _fso = FireStore();
    AuthMethods _amo = AuthMethods();
    _fso.deleteImage(uid: context.read<Providers>().getUser.uid);
    String photoURL = await _fso.uploadImage(image: profilepic!, typeOfImage: "profilepic");
    if(context.mounted){
      context.read<Providers>().setPhotoURL = photoURL;
      context.read<Providers>().setEmail = _emailController.text;
      context.read<Providers>().setName = _nameController.text;
      _amo.updateUser(context.read<Providers>().getUser);
    }
    setState(() {
      isLoading = false;
    });
  } 
    
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/20, vertical: MediaQuery.of(context).size.height/40),
        child: isLoading? const Loader() : 
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CaloriFitTitle(color: Colors.white),
            SizedBox(height: MediaQuery.of(context).size.height/40,),
            const SettingsTitle(text: "EDIT PROFILE"),
            SizedBox(height: MediaQuery.of(context).size.height/20,),
            Stack(
              clipBehavior: Clip.none,
              children:[
                CircleAvatar(
                  radius: 64,
                  backgroundImage: NetworkImage(context.read<Providers>().getUser.photoURL)
                ),
                Positioned(
                  right: -20,
                  bottom: 0,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: grey,
                      borderRadius: BorderRadius.circular(25)
                    ),
                    child: IconButton(
                      onPressed: () => selectImage(), 
                      icon: const Icon(Icons.camera_alt_rounded)
                      ),
                  )
                  )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height/10,),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 5),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(width: 1, color: grey),)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Name", style: TextStyle(color: maingreen),),
                  TextInputField(tec: _nameController, tit: TextInputType.name, hintText: context.read<Providers>().getUser.name,)
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 5),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(width: 1, color: grey), bottom: BorderSide(width: 1, color: grey))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Email", style: TextStyle(color: maingreen),),
                  TextInputField(tec: _emailController, tit: TextInputType.emailAddress, hintText: context.read<Providers>().getUser.email,)
                ],
              ),
            ),
            Flexible(flex: 1, child: Container()),
            GestureDetector(
              onTap: () => update(),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.3, vertical: 15),
                decoration: BoxDecoration(
                  color: maingreen,
                  borderRadius: BorderRadius.circular(28)
                ),
                child: const Text("Save", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),),
              ),
            ),
            const SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}