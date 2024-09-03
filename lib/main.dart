import 'package:flutter/material.dart';
import 'package:true_receitas/screens/categories_meals_screen.dart';
import 'package:true_receitas/screens/categories_screen.dart';
import 'package:true_receitas/screens/meal_detail_screen.dart';
import 'package:true_receitas/screens/tabs_screen.dart';
import './utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
        title: 'Vamos cozinhar?',
        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
            primary: Colors.pink,
            secondary: Colors.amber,
          ),
          textTheme: theme.textTheme.copyWith(
            titleLarge: const TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            bodyMedium: const TextStyle(
              fontFamily: 'Raleway',
            ),
          ),
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        ),
        home: const CategoriesScreen(),
        initialRoute: AppRoutes.HOME,
        routes: {
          AppRoutes.HOME: (ctx) => const TabsScreen(),
          AppRoutes.CATEGORIES_MEALS: (ctx) => const CategoriesMealsScreen(),
          AppRoutes.MEAL_DETAIL: (ctx) => const MealDetailSreen(),
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (_) {
            return const CategoriesScreen();
          });
        });
  }
}
