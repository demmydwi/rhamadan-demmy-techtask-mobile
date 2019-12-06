class Recipe {
  String title;
  List<String> ingredients;

  Recipe({this.title, this.ingredients});

  Recipe.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    ingredients = json['ingredients'] != null
        ? (json['ingredients'] as List<dynamic>)
            .map((item) => item.toString())
            .toList()
        : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['ingredients'] = this.ingredients;
    return data;
  }

  String get ingredientsString =>
      ingredients.isEmpty ? "" : ingredients.join(", ");

  static List<Map<String, dynamic>> get mockData => [
        {
          "title": "Ham and Cheese Toastie",
          "ingredients": ["Ham", "Cheese", "Bread", "Butter"]
        },
        {
          "title": "Salad",
          "ingredients": [
            "Lettuce",
            "Tomato",
            "Cucumber",
            "Beetroot",
            "Salad Dressing"
          ]
        },
        {
          "title": "Hotdog",
          "ingredients": ["Hotdog Bun", "Sausage", "Ketchup", "Mustard"]
        }
      ];
}
