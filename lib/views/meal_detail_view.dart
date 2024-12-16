import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealDetailView extends StatelessWidget {
  final Meal meal;

  MealDetailView({required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.strMeal),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Meal
            Image.network(
              meal.strMealThumb,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
              errorBuilder: (context, error, stackTrace) =>
                  Icon(Icons.error, size: 200),
            ),
            SizedBox(height: 20),
            // Nama Meal
            Text(
              meal.strMeal,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Detail Kategori dan Area
            Text('Category: ${meal.strCategory}'),
            Text('Area: ${meal.strArea}'),
            SizedBox(height: 20),
            // Instruksi
            Text(
              'Instructions:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              meal.strInstructions,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
