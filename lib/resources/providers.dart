import 'package:calori_fit/models/enums.dart';
import 'package:calori_fit/resources/auth.dart';
import 'package:flutter/material.dart';

import '../models/User.dart';

class Providers extends ChangeNotifier{
  final AuthMethods _amo = AuthMethods();
  User? _user; 

  User get getUser => _user!;

  set setGender (Genders gender) {
    _user!.gender = gender;
    notifyListeners();
  }

  set setAge (int age){
    _user!.age = age;
    notifyListeners();
  }

  set setWeight (int weight){
    _user!.weight = weight;
    notifyListeners();
  }

  set setHeight (int height){
    _user!.height = height;
    notifyListeners();
  }

  set setCalorieGoal(int calorieGoal){
    _user!.calorieGoal = calorieGoal;
    notifyListeners();
  }

  Future<void> refreshUser() async{
    User user = await _amo.getUserDetails();
    _user = user;
    print("this is user from provider");
    print(_user!.age);
    notifyListeners();
  }
}