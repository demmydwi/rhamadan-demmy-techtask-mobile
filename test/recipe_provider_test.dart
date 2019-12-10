import 'package:tech_task/provider/recipe_provider.dart';
import 'package:tech_task/provider/state.dart';
import 'package:test/test.dart';

void main() {
  group('recipe provider group', () {
    final recipeProvider = new RecipeProvider();

    test("recipeProvider init state", () async {
      expect(recipeProvider.state, ProviderState.onInit);
      expect(recipeProvider.recipes, null);
    });

    test("recipeProvider fetch recipes", () async {
      recipeProvider.getRecipes(onCompleted: () {
        expect(recipeProvider.state, ProviderState.onLoaded);
        expect(recipeProvider.recipes != null, true);
      });
    });

  });
}
