import 'package:calori_fit/models/enums.dart';

class Meal{

  MealType mealType;
  int calorieCount;
  String meal;

  Meal({required this.mealType, required this.calorieCount, required this.meal});

  Map<String, dynamic> toJSON()=>{
    'mealType': mealType==MealType.BREAKFAST? "BREAKFAST" : mealType==MealType.LUNCH? "LUNCH" : "DINNER",
    'calorieCount' : calorieCount,
    'meal' : meal
  };

  static List<Meal> modelFromSnap(meals){
    print(meals);
    List<Meal> usermeals = meals.map((thismeal) =>Meal(
      mealType: thismeal["mealType"] == 'BREAKFAST' ? MealType.BREAKFAST : thismeal["mealType"] == 'LUNCH' ? MealType.LUNCH : MealType.DINNER, 
      calorieCount: thismeal["calorieCount"], 
      meal: thismeal["meal"])).toList();
    print(usermeals);
    List<Meal> temp = [];
    return [];
  }
}