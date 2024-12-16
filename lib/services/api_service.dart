import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/meal.dart';

class ApiService {
  static const String baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  static Future<List<Meal>> getRandomMeals(int count) async {
    List<Meal> meals = [];
    for (int i = 0; i < count; i++) {
      final response = await http.get(Uri.parse('$baseUrl/random.php'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final mealData = data['meals'][0];
        print('Fetched Meal: ${mealData['strMeal']}'); // Debug nama meal
        meals.add(Meal.fromJson(mealData));
      }
    }
    return meals;
  }


  // Mencari meal berdasarkan query
  static Future<List<Meal>> searchMeals(String query) async {
    final response = await http.get(Uri.parse('$baseUrl/search.php?s=$query'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['meals'] as List?)?.map((meal) => Meal.fromJson(meal)).toList() ?? [];
    }
    return [];
  }
}
