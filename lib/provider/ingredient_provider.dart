import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_task/model/ingredient.dart';

class IngredientProvider with ChangeNotifier {

  List<Ingredient> _ingredients;

  List<Ingredient> get ingredients  => _ingredients;

  set ingredients(List<Ingredient> newValue) {
    this._ingredients = newValue;
    notifyListeners();
  }

}

enum IngredientState {
  onRefresh, onLoading, onLoaded, onEmpty, onError
}