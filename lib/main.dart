import 'package:flutter/material.dart';
import 'package:true_receitas/screens/categories_screen.dart';

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
    );
  }
}
