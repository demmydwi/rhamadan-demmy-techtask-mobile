import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_task/model/ingredient.dart';
import 'package:tech_task/model/recipe.dart';
import 'package:tech_task/network/api_manager.dart';
import 'package:tech_task/provider/state.dart';

class RecipeProvider with ChangeNotifier {
  List<Recipe> _recipes;

  List<Recipe> get recipes => _recipes;

  set recipes(List<Recipe> newValue) {
    this._recipes = newValue;
    notifyListeners();
  }

  ProviderState _state = ProviderState.onInit;

  ProviderState get state => _state;

  set state(ProviderState newValue) {
    this._state = newValue;
    notifyListeners();
  }

  String _errMessage;

  String get errMessage => _errMessage;

  set errMessage(String newValue) {
    this._errMessage = newValue;
    this._state = ProviderState.onError;
    notifyListeners();
  }

  getRecipes({List<Ingredient> ingredients, VoidCallback onSuccess}) async {
    state = ProviderState.onLoading;
    await Future.delayed(Duration(seconds: 1));
    List<String> _strIngredient =
        ingredients.map((item) => item.title).toList();
    print(_strIngredient);
    ApiManager.getRecipes(_strIngredient, onError: (errMessage) {
      this.errMessage = errMessage;
    }, onSuccess: (data) {
      _recipes = data.map((item) => Recipe.fromJson(item.toJson())).toList();
      var _ = _strIngredient.map((item) {
        _recipes = _recipes.where((i) => i.ingredients.contains(item)).toList();
      }).toList();
      if (_recipes.isEmpty) {
        _state = ProviderState.onEmpty;
      } else {
        _state = ProviderState.onLoaded;
      }
      print(data.length);
      onSuccess();
      notifyListeners();
    });
  }
}
