import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_task/model/ingredient.dart';
import 'package:tech_task/network/api_manager.dart';

class IngredientProvider with ChangeNotifier {
  List<Ingredient> _ingredients;

  List<Ingredient> get ingredients => _ingredients;

  set ingredients(List<Ingredient> newValue) {
    this._ingredients = newValue;
    notifyListeners();
  }

  IngredientState _state = IngredientState.onInit;

  IngredientState get state => _state;

  set state(IngredientState newValue) {
    this._state = newValue;
    notifyListeners();
  }

  String _errMessage;

  String get errMessage => _errMessage;

  set errMessage(String newValue) {
    this._errMessage = newValue;
    this._state = IngredientState.onError;
    notifyListeners();
  }

  refresh() {
    _state = IngredientState.onInit;
    _ingredients = [];
    notifyListeners();
  }

  getIngredients() {
    ApiManager.getIngredients(onError: (errMessage) {
      this.errMessage = errMessage;
    }, onSuccess: (data) {
      _ingredients =
          data.map((item) => Ingredient.fromJson(item.toJson())).toList();
      _ingredients.sort( (a,b) => b.useBy.compareTo(a.useBy));
      if (_ingredients.isEmpty) {
        _state = IngredientState.onEmpty;
      } else {
        _state = IngredientState.onLoaded;
      }
      print(data.length);
      notifyListeners();
    });
  }
}

enum IngredientState { onInit, onLoaded, onEmpty, onError }
