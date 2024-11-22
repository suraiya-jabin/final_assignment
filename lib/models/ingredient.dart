class Ingredient {
  final int recipeId;
  final String name;

  Ingredient({required this.recipeId, required this.name});

  Ingredient copyWith({int? recipeId, String? name}) {
    return Ingredient(
      recipeId: recipeId ?? this.recipeId,
      name: name ?? this.name,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Ingredient && name == other.name;

  @override
  int get hashCode => name.hashCode;
}
