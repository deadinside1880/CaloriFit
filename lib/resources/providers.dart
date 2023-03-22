import 'package:calori_fit/resources/auth.dart';
import 'package:flutter/material.dart';

import '../models/User.dart';

class Providers extends ChangeNotifier{
  final AuthMethods _amo = AuthMethods();
  User? _user; 

  User get getUser => _user!;

  Future<void> refreshUser() async{
    User user = await _amo.getUserDetails();
    _user = user;
    notifyListeners();
  }
}