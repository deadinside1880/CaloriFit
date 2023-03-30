import 'package:cloud_firestore/cloud_firestore.dart';

class Workout{

  final String name;
  final double calsPerMin;
  final String id;

  Workout({required this.calsPerMin, required this.id, required this.name});

  static Workout modelFromSnap(DocumentSnapshot snapshot){
    return Workout(
      calsPerMin: snapshot['calsPerMin'].toDouble(), 
      id: snapshot['id'], 
      name: snapshot['name']
    );
  }
}