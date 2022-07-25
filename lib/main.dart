import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meal_app/dummy-data%20.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/views/category_meals_view.dart';
import 'package:meal_app/views/category_view.dart';
import 'package:meal_app/views/filter_view.dart';
import 'package:meal_app/views/meal_detail_view.dart';
import '../views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Meal> _availableMeals = dummyMeals;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = dummyMeals.where((meal) {
        if (_filters['gluten'] == false && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == false && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == false && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == false && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(dummyMeals.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Meal',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 11),
        fontFamily: 'Raleway',
        // textTheme: ThemeData.light().textTheme.copyWith(
        //     bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
        //     bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
        //     titleMedium:
        //         TextStyle(fontSize: 24, fontFamily: 'RobotoCondensed')),
      ),
      // home: const CategoryScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => MyHomePage(_favoriteMeals),
        CategoryMealScreen.routName: (ctx) =>
            CategoryMealScreen(avaliableMeal: _availableMeals),
        MealDetailScreen.routName: (ctx) =>
            MealDetailScreen(_toggleFavorite, isMealFavorite),
        FilterScreen.routName: (ctx) =>
            FilterScreen(filters: _filters, saveFilters: _setFilters)
      },
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   if(settings.name == '/meal-detail'){

      //   }
      //   return MaterialPageRoute(builder: (ctx) => CategoryScreen());
      // },
      // onUnknownRoute: (settings){
      //   return MaterialPageRoute(builder: (_) =>
      // },
    );
  }
}
