import 'dart:convert';
import 'package:flutter/material.dart';
import 'recipe.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Recipes',
      debugShowCheckedModeBanner: false,
      home: RecipeListScreen(),
    );
  }
}

// the json data for the recipes
const String recipeData = '''
{
  "recipes": [
    {
      "title": "Pasta Carbonara",
      "description": "Creamy pasta dish with bacon and cheese.",
      "ingredients": ["spaghetti", "bacon", "egg", "cheese"]
    },
    {
      "title": "Caprese Salad",
      "description": "Simple and refreshing salad with tomatoes, mozzarella, and basil.",
      "ingredients": ["tomatoes", "mozzarella", "basil"]
    },
    {
      "title": "Banana Smoothie",
      "description": "Healthy and creamy smoothie with bananas and milk.",
      "ingredients": ["bananas", "milk"]
    },
    {
      "title": "Chicken Stir-Fry",
      "description": "Quick and flavorful stir-fried chicken with vegetables.",
      "ingredients": ["chicken breast", "broccoli", "carrot", "soy sauce"]
    },
    {
      "title": "Grilled Salmon",
      "description": "Delicious grilled salmon with lemon and herbs.",
      "ingredients": ["salmon fillet", "lemon", "olive oil", "dill"]
    },
    {
      "title": "Vegetable Curry",
      "description": "Spicy and aromatic vegetable curry.",
      "ingredients": ["mixed vegetables", "coconut milk", "curry powder"]
    },
    {
      "title": "Berry Parfait",
      "description": "Layered dessert with fresh berries and yogurt.",
      "ingredients": ["berries", "yogurt", "granola"]
    }
  ]
}
''';

class RecipeListScreen extends StatefulWidget {
  @override
  State<RecipeListScreen> createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  List<Recipe> recipes = [];

  @override
  void initState() {
    super.initState();
    loadRecipes();
  }

  void loadRecipes() {
    // parse the json and get the recipes list
    Map<String, dynamic> jsonData = jsonDecode(recipeData);
    List<dynamic> recipeList = jsonData['recipes'];

    setState(() {
      recipes = recipeList.map((item) => Recipe.fromJson(item)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Food Recipes',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          Recipe recipe = recipes[index];

          return ListTile(
            leading: Icon(Icons.restaurant_menu, color: Colors.grey),
            title: Text(
              recipe.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(recipe.description),
          );
        },
      ),
    );
  }
}
