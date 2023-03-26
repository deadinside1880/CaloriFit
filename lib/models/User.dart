// ignore: constant_identifier_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import 'Meal.dart';
import 'enums.dart';

class User{
  String uid;
  String name;
  Genders gender;
  int age;
  int weight;
  int calorieGoal;
  String email;
  String photoURL;
  int height;
  List<Meal> meals;
  List<int> weeklyCalories;
  int currentStreak;
  int highestStreak;

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
    required this.weeklyCalories,
    required this.currentStreak,
    required this.highestStreak
  });

  Map<String,dynamic> toJSON() =>{
    'uid' : uid,
    'name' : name,
    'age' : age,
    'gender' : gender == Genders.FEMALE? 'FEMALE' : 'MALE',
    'weight' : weight,
    'calorieGoal' : calorieGoal,
    'email' : email,
    'photoURL' : photoURL,
    'height' : height,
    'meals' : meals.map((meal) => meal.toJSON()).toList(),
    'weeklyCalories' : weeklyCalories,
    'currentStreak' : currentStreak,
    'highestStreak' : highestStreak
  };

  static User modelFromSnap(DocumentSnapshot snap){
      var snapshot = snap.data() as Map<String, dynamic>;
    return User(    
    uid : snapshot['uid'],
    name: snapshot['name'],
    age : snapshot['age'],
    gender : snapshot['gender'] == 'FEMALE'? Genders.FEMALE : Genders.MALE,
    weight : snapshot['weight'],
    calorieGoal : snapshot['calorieGoal'],
    email : snapshot['email'],
    photoURL : snapshot['photoURL'],
    height : snapshot['height'],
    meals : snapshot['meals'].isEmpty? [] : Meal.modelFromSnap(snapshot['meals']),
    weeklyCalories : snapshot['weeklyCalories'].isEmpty ? [] : snapshot['weeklyCalories'].map((calories) => calories as int).toList(),
    currentStreak: snapshot['currentStreak'].toInt(),
    highestStreak: snapshot['highestStreak'].toInt()
    );
  }
}