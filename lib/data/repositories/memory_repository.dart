import 'dart:async';
import '../../models/ingredient.dart';
import '../../models/recipe.dart';
import 'repository.dart';

class MemoryRepository implements Repository {
  List<Recipe> _recipes = [];
  List<Ingredient> _ingredients = [];

  final _recipeStreamController = StreamController<List<Recipe>>.broadcast();
  final _ingredientStreamController = StreamController<List<Ingredient>>.broadcast();

  MemoryRepository() {
    _recipeStreamController.add(_recipes);
    _ingredientStreamController.add(_ingredients);
  }

  @override
  Stream<List<Recipe>> watchAllRecipes() => _recipeStreamController.stream;

  @override
  Stream<List<Ingredient>> watchAllIngredients() => _ingredientStreamController.stream;

  @override
  Future<int> insertRecipe(Recipe recipe) async {
    if (_recipes.contains(recipe)) return 0;

    _recipes.add(recipe);
    _recipeStreamController.add(_recipes);

    final ingredients = recipe.ingredients.map(
      (ingredient) => ingredient.copyWith(recipeId: recipe.id),
    );
    await insertIngredients(ingredients.toList());

    return 1;
  }

  @override
  Future<int> insertIngredients(List<Ingredient> ingredients) async {
    _ingredients.addAll(ingredients);
    _ingredientStreamController.add(_ingredients);

    return ingredients.length;
  }

  void dispose() {
    _recipeStreamController.close();
    _ingredientStreamController.close();
  }
}
