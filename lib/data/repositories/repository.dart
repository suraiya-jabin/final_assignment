

import '../../models/ingredient.dart';
import '../../models/recipe.dart';

abstract class Repository {
  Stream<List<Recipe>> watchAllRecipes();
  Stream<List<Ingredient>> watchAllIngredients();

  Future<int> insertRecipe(Recipe recipe);
  Future<int> insertIngredients(List<Ingredient> ingredients);
}
