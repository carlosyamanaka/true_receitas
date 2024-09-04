import 'package:flutter/material.dart';
import 'package:true_receitas/data/dummy_data.dart';
import 'package:true_receitas/models/meal.dart';
import 'package:true_receitas/models/settings.dart';
import 'package:true_receitas/screens/categories_meals_screen.dart';
import 'package:true_receitas/screens/categories_screen.dart';
import 'package:true_receitas/screens/meal_detail_screen.dart';
import 'package:true_receitas/screens/settings_screen.dart';
import 'package:true_receitas/screens/tabs_screen.dart';
import './utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _avaliableMeals = dummyMeals;
  final List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _avaliableMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

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
        home: TabsScreen(_favoriteMeals),
        routes: {
          AppRoutes.CATEGORIES_MEALS: (ctx) =>
              CategoriesMealsScreen(_avaliableMeals),
          AppRoutes.MEAL_DETAIL: (ctx) =>
              MealDetailScreen(_toggleFavorite, isFavorite),
          AppRoutes.SETTINGS: (ctx) => SettingsScreen(_filterMeals, settings),
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (_) {
            return const CategoriesScreen();
          });
        });
  }
}
