import 'package:calori_fit/models/enums.dart';

class Meal{

  MealType mealType;
  int calorieCount;
  String meal;

  Meal(this.mealType, this.calorieCount, this.meal);

  static List<Meal> modelFromSnap(meals){
    print(meals);
    print(meals[0]);
    return 
    meals.map((thismeal) =>Meal(
      thismeal.mealType == 'BREAKFAST' ? MealType.BREAKFAST : thismeal.mealType == 'LUNCH' ? MealType.LUNCH : MealType.DINNER, 
      thismeal.calorieCount, 
      thismeal.meal)).toList();
  }
}