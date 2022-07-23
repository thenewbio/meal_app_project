import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meal_app/views/category_meals_view.dart';
import 'package:meal_app/views/category_view.dart';
import 'package:meal_app/views/meal_detail_view.dart';
import '../views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        '/': (ctx) => const CategoryScreen(),
        CategoryMealScreen.routName: (ctx) => CategoryMealScreen(),
        MealDetailScreen.routName: (ctx) => const MealDetailScreen(),
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
