class Recipe {
  final String name;
  final String images;
  final double rating;
  final String totalTimes;

  Recipe({ required this.images,required this.name,required this.rating,required this.totalTimes});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
      name: json['name'] as String,
      images: json['images'][0]['hostedLargeUrl'] as String,
      rating: json['rating'] as double,
      totalTimes: json['totalTime'] as String,
    );
  }

  static List<Recipe> recipeFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe{name : $name, image: $images, rating :$rating, totalTimes: $totalTimes}';
  }
}
