import 'package:flutter/material.dart';
import 'package:meal_app/widgets/category_item.dart';
import '../dummy-data .dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Meal Shop'),
      //   centerTitle: true,
      // ),
      body: GridView(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: dummyCategories.map((dummyData) {
            return CategoryItem(dummyData.id, dummyData.title, dummyData.color);
          }).toList()),
    );
  }
}
