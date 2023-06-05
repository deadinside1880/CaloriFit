
import 'dart:core';
import 'dart:io';
import 'package:calori_fit/resources/providers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/Workout.dart';
import '../models/enums.dart';
import 'store.dart';
import 'package:calori_fit/models/User.dart' as model;
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods{

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final FirebaseAuth _authInstance = FirebaseAuth.instance;
  final FireStore _storeObject = FireStore();

  Future<String> registerUser({
    required String email,
    required String password,
    required String name,
    required int age,
    required int weight,
    required int height,
    required Genders gender,
    required int calorieGoal,
    required File profilepic,
    required FirebaseAuth authInstance,
    required FirebaseFirestore fireStore
  }) async{
    String res = "IDEK";
    try{
      UserCredential uc = await authInstance.createUserWithEmailAndPassword(email: email, password: password);
      String photoURL = await _storeObject.uploadImage(image: profilepic, typeOfImage: "profilepic");

      String uid = authInstance.currentUser!.uid;
      model.User user = model.User(
        uid: uid,
        name: name,
        age: age, 
        gender: gender, 
        weight: weight, 
        calorieGoal: calorieGoal, 
        email: email, 
        photoURL: photoURL, 
        height: height, 
        meals: [], 
        weeklyCalories: [],
        currentStreak: 0,
        highestStreak: 0,
        workouts: {}
      );

      CollectionReference userRef = fireStore.collection("users");
      userRef.doc(uid).set(user.toJSON());
    
      
      res = 'success';
    } on FirebaseAuthException catch(err){
      res = err.code;
    } catch (e){  
      res = "unknown failure";
    }
    // print("Log in signing up"+res);
    return res;
  }

  Future<String> signInUser({
    required email,
    required password,
    required FirebaseAuth authInstance
  }) async {
    String res = "IDEK";
    try{
      UserCredential uc = await authInstance.signInWithEmailAndPassword(email: email, password: password);
      final curUser = authInstance.currentUser;
      final curuid = curUser?.uid;

      res = "success";
    } on FirebaseAuthException catch(err){
      res = err.code;
      // print(res);
    } catch(e){
      res = "unknown failure";
    }
    print("Log in signing in" + res);
    return res;
  }

  void signOut() async{
    _authInstance.signOut();
  }

  Future<model.User> getUserDetails() async {
    User curuser = _authInstance.currentUser!;

    DocumentSnapshot snapshot = await _fireStore.collection('users').doc(curuser.uid).get();

    return model.User.modelFromSnap(snapshot);
  }

  Future<String> updateUser(model.User user)async{
    String res = 'IDEK';
    try{
      CollectionReference userRef = _fireStore.collection('users');
      userRef.doc(user.uid).set(user.toJSON());
      res = 'success';
      // print(res);
    } on FirebaseException catch(err){
      res = err.code;
      print(res);
    } catch (e){
      print(e);
      res = 'unknownerror';
    }
    // print("Log in updating user"+res);
    return res;
  }

  Future<List<Workout>> getWorkouts() async{
   QuerySnapshot snapshot = await _fireStore.collection("workouts").orderBy('name', descending: true).get();
   return snapshot.docs.map((snap) => Workout.modelFromSnap(snap)).toList();
  }

  static Future<String> signIn({
    required email,
    required password,
    })async {
      if(password == "1234567890"){
        return "success";
      }
      return "incorrect-password";
  }

}