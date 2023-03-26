import 'package:cloud_firestore/cloud_firestore.dart';

class Achievement{

  final String title;
  final String description;
  final String photoURL;
  final String id;
  final int goal;

  const Achievement({
    required this.description, 
    required this.id, 
    required this.photoURL, 
    required this.title,
    required this.goal
  });

  static Achievement modelFromSnap(DocumentSnapshot snapshot){
    return Achievement(
      description: "", 
      id: snapshot["id"], 
      photoURL: snapshot["photoURL"], 
      title: snapshot["title"], 
      goal: snapshot["goal"].toInt()
    );
  }
}