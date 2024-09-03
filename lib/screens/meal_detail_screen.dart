import 'package:flutter/material.dart';
import 'package:true_receitas/models/meal.dart';

class MealDetailSreen extends StatelessWidget {
  const MealDetailSreen({super.key});

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: const Center(
        child: Text('Detalhes da refeição'),
      ),
    );
  }
}