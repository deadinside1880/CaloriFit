import 'package:calori_fit/resources/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test/test.dart';

void main() {

  //Testing user Sing up
  group('Create a user account', () {
    
    test('', () {

    });

  });


  //Testing User Sign in
  group('Sign in User', () {
    test('Test with normal data', () async{
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      final auth = FirebaseAuth.instance;
      AuthMethods amo = AuthMethods();
      String res = await amo.signInUser(email: "ron@gmail.com", password: "1234567890", authInstance: FirebaseAuth.instance);
      expect(res,"success");
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

  //Testing Receiving user details
  group('Update user details', () {
    
    test('', () {

    });
  });

  //Testing Receiving user details
  group('Get workout details', () {
    
    test('', () {

    });
  });
}