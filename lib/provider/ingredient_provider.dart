import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_task/model/ingredient.dart';
import 'package:tech_task/network/api_manager.dart';
import 'package:tech_task/provider/state.dart';

class IngredientProvider with ChangeNotifier {
  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  set selectedDate(DateTime newValue) {
    this._selectedDate = newValue;
    refresh();
    notifyListeners();
  }

  List<Ingredient> _ingredients;

  List<Ingredient> get ingredients => _ingredients;

  set ingredients(List<Ingredient> newValue) {
    this._ingredients = newValue;
    notifyListeners();
  }

  List<Ingredient> _selectedIngredients = [];

  List<Ingredient> get selectedIngredients => _selectedIngredients;

  set selectedIngredients(List<Ingredient> newValue) {
    this._selectedIngredients = newValue;
    notifyListeners();
  }

  void selectIngredient(Ingredient ingredient){
    if (_selectedIngredients.contains(ingredient)) {
      _selectedIngredients.remove(ingredient);
    } else {
      _selectedIngredients.add(ingredient);
    }
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

  refresh() {
    _state = ProviderState.onInit;
    _ingredients = [];
    notifyListeners();
  }

  getIngredients() {
    ApiManager.getIngredients(onError: (errMessage) {
      this.errMessage = errMessage;
    }, onSuccess: (data) {
      _ingredients =
          data.map((item) => Ingredient.fromJson(item.toJson())).toList();
      _ingredients.sort((a, b) => b.useBy.compareTo(a.useBy));
      if (_ingredients.isEmpty) {
        _state = ProviderState.onEmpty;
      } else {
        _state = ProviderState.onLoaded;
      }
      print(data.length);
      notifyListeners();
    });
  }
}

