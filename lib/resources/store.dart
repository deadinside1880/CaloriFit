import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
class FireStore{

  final _storeRef = FirebaseStorage.instance.ref();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> uploadImage({
    required File image,
    required String typeOfImage
  }) async{
    String imgURL="";
    String res = "IDEK";
    try{
      final imagesRef = _storeRef.child("images").child(_auth.currentUser!.uid);
      await imagesRef.putFile(image);
      imgURL = await imagesRef.getDownloadURL();
    } on FirebaseException catch(err){
      res = err.code;
    } catch(e){
      res = "unknown error";
    }
    return imgURL;
  }

}