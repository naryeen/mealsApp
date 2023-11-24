import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screens/meals.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

// this wont return any data because it's return type is void..
  void _selectCategory(BuildContext context) {
    // Navigator.push(context, route);
    // Loading the screen
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (cx) => const MealsScreen(
          title: 'Some title',
          meals: [],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pick your category'),
        ),
        body: GridView(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: [
            // availableCategories.map((category)=>CategoryGridItem(category: category,))
            for (final category in availableCategories)
              // widgets for the output
              CategoryGridItem(
                category: category,
                onSelectCategory: () {
                  _selectCategory(context);
                },
              ),
          ],
        ));
  }
}
