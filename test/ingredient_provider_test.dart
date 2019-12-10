import 'package:tech_task/function/date.dart';
import 'package:tech_task/provider/state.dart';
import 'package:test/test.dart';
import 'package:tech_task/provider/ingredient_provider.dart';

void main() {
  group('ingredient provider group', () {
    final ingredientProvider = new IngredientProvider();

    test("ingredientProvider init state", () async {
      expect(ingredientProvider.state, ProviderState.onInit);
      expect(ingredientProvider.ingredients, null);
      expect(ingredientProvider.selectedDate.day, DateTime.now().day);
      expect(ingredientProvider.selectedIngredients, []);
    });

    test("ingredientProvider fetch ingredients", () async {
      ingredientProvider.getIngredients(onCompleted: () {
        expect(ingredientProvider.state, ProviderState.onLoaded);
        expect(ingredientProvider.ingredients.isNotEmpty, true);
      });
    });

    test("ingredientProvider selected next day", () async {
      var nextDay = DateTime.now().add(Duration(days: 1));
      ingredientProvider.selectedDate = nextDay;
      expect(ingredientProvider.selectedDate, nextDay);
      ingredientProvider.getIngredients(onCompleted: () {
        var dateNowString = userFormat.format(DateTime.now());

        var ingredientsUseByNow = ingredientProvider.ingredients
            .where((item) => item.useBy == dateNowString)
            .toList();

        expect(ingredientsUseByNow.isEmpty, true);

        ingredientProvider
            .selectIngredient(ingredientProvider.ingredients.first);
        expect(ingredientProvider.selectedIngredients.isNotEmpty, true);
      });
    });
  });
}
