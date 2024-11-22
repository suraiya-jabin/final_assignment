import 'ingredient.dart';

class Recipe {
  final int id;
  final String name;
  final List<Ingredient> ingredients;

  Recipe({required this.id, required this.name, required this.ingredients});

  Recipe copyWith({int? id, String? name, List<Ingredient>? ingredients}) {
    return Recipe(
      id: id ?? this.id,
      name: name ?? this.name,
      ingredients: ingredients ?? this.ingredients,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Recipe && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
