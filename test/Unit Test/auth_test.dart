import 'dart:io';

import 'package:calori_fit/models/enums.dart';
import 'package:calori_fit/resources/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test/test.dart';

void main() {

  //Testing user Sing up
  group('Create a user account', () {
    
    test('Test normal account creation', () async {
      AuthMethods amo = AuthMethods();
      String res = await amo.registerUser(
        email: "someone@gmail.com", 
        password: "1NV!CTUS", 
        name: "Someone Anyone", 
        age: 32, 
        weight: 67, 
        height: 169, 
        gender: Genders.MALE, 
        calorieGoal: 3000, 
        profilepic: File('../assets/image.jpeg'), 
        authInstance: FirebaseAuth.instance, 
        fireStore: FirebaseFirestore.instance
      );

      expect(res, 'success');
    });

     test('Test invalid password (less than 6 characters) account creation', () async {
      AuthMethods amo = AuthMethods();
      String res = await amo.registerUser(
        email: "someone@gmail.com", 
        password: "pw<6", 
        name: "Someone Anyone", 
        age: 32, 
        weight: 67, 
        height: 169, 
        gender: Genders.MALE, 
        calorieGoal: 3000, 
        profilepic: File('../assets/image.jpeg'), 
        authInstance: FirebaseAuth.instance, 
        fireStore: FirebaseFirestore.instance
      );

      expect(res, 'weak-password');
    });

  });


  //Testing User Sign in
  group('Sign in User', () {
    test('Test with normal data', () async{
      String res = await AuthMethods.signIn(email: "ron@gmail.com", password: "1234567890");
      expect(res,"success");
    });

    test('Test with wrong data', () async{
      String res = await AuthMethods.signIn(email: "ron@gmail.com", password: "afgrgsdv");
      expect(res,"incorrect-password");
    });

  });

  // Testing sign out
  group('Sign out test', () {

    test('', () {

    });
  });

  //Testing Receiving user details
  group('Get user details', (){
    
    test('', () {

    });
  });

  //Testing Updating user details
  group('Update user details', () {
    
    test('Test with normal User Data', () {

    });
  });

  //Testing Receiving user details
  group('Get workout details', () {
    
    test('', () {

    });
  });
}