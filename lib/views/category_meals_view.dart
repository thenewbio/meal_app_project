import 'package:flutter/material.dart';
import 'package:meal_app/dummy-data%20.dart';
import 'package:meal_app/widgets/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routName = 'category-meals';
  // final String categoryId;
  // final String title;
  // const CategoryMealScreen(this.categoryId, this.title, {Key? key})
  //     : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = dummyMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: ListView.builder(
            itemCount: categoryMeals.length,
            itemBuilder: ((context, index) {
              return MealItem(
                  id: categoryMeals[index].id,
                  title: categoryMeals[index].title,
                  imageUrl: categoryMeals[index].imageUrl,
                  duration: categoryMeals[index].duration,
                  complexity: categoryMeals[index].complexity,
                  affordability: categoryMeals[index].affordability);
            })));
  }
}
