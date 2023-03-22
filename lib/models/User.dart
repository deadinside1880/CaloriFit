// ignore: constant_identifier_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import 'Meal.dart';
import 'enums.dart';

class User{
  String uid;
  final String name;
  Genders gender;
  int age;
  int weight;
  int calorieGoal;
  final String email;
  String photoURL;
  int height;
  List<Meal> meals;
  List<int> weeklyCalories;

  User({
    required this.uid,
    required this.name,
    required this.age, 
    required this.gender, 
    required this.weight, 
    required this.calorieGoal, 
    required this.email,
    required this.photoURL, 
    required this.height, 
    required this.meals,
    required this.weeklyCalories
  });

  Map<String,dynamic> toJSON() =>{
    'uid' : uid,
    'age' : age,
    'gender' : gender == Genders.FEMALE? 'FEMALE' : 'MALE',
    'weight' : weight,
    'calorieGoal' : calorieGoal,
    'email' : email,
    'photoURL' : photoURL,
    'height' : height,
    'meals' : meals,
    'weeklyCalories' : weeklyCalories
  };

  static User modelFromSnap(DocumentSnapshot snap){
      var snapshot = snap.data() as Map<String, dynamic>;
    return User(    
    uid : snapshot['uid'],
    name: snapshot['name'],
    age : snapshot['age'],
    gender : snapshot['gender'],
    weight : snapshot['weight'],
    calorieGoal : snapshot['calorieGoal'],
    email : snapshot['email'],
    photoURL : snapshot['photoURL'],
    height : snapshot['height'],
    meals : snapshot['meals'],
    weeklyCalories : snapshot['weeklyCalories']
    );
  }
}