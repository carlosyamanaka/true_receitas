import 'package:flutter/material.dart';
import 'package:true_receitas/components/meal_item.dart';
import 'package:true_receitas/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoriteScreen(this.favoriteMeals, {super.key});

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text(
          'Nenhuma refeição foi marcada como favorita!',
          style: TextStyle(color: Colors.black),
        ),
      );
    } else { //Unicoi problema pendente é quando clica no botão de voltar quando desfavorita uma comida entrando pela tela de favoritos, ao dar o pop na tela, a ultima tela vai estar no cache e por isso ainda aparecerá como se fosse favorito, mas no "backend", já vai estar fora
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(favoriteMeals[index]);
        },
      );
    }
  }
}
