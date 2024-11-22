import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/repositories/repository.dart';
import '../../models/ingredient.dart';


class GroceriesScreen extends StatefulWidget {
  @override
  _GroceriesScreenState createState() => _GroceriesScreenState();
}

class _GroceriesScreenState extends State<GroceriesScreen> {
  late List<Ingredient> currentIngredients = [];
  late List<Ingredient> searchIngredients = [];
  bool searching = false;

  @override
  void initState() {
    super.initState();

    // Access the Repository through the Provider
    final repository = context.read<Repository>();
    repository.watchAllIngredients().listen((ingredients) {
      setState(() {
        currentIngredients = ingredients;
      });
    });
  }

  void startSearch(String searchString) {
    setState(() {
      searching = searchString.isNotEmpty;
      searchIngredients = currentIngredients
          .where((ingredient) =>
              ingredient.name.toLowerCase().contains(searchString.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final ingredientsToShow = searching ? searchIngredients : currentIngredients;

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(hintText: 'Search Ingredients'),
          onChanged: startSearch,
        ),
      ),
      body: ListView.builder(
        itemCount: ingredientsToShow.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(ingredientsToShow[index].name),
          );
        },
      ),
    );
  }
}
