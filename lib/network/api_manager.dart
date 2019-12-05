import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tech_task/model/Ingredient.dart';
import 'package:tech_task/model/recipe.dart';

import 'api_component.dart';

class ApiManager {
  static checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  static request(
    String path, {
    Map<String, dynamic> queryParams,
    ValueChanged<dynamic> onSuccess,
    ValueChanged<String> onError,
  }) async {
    var isConnected = await checkConnection();
    if (!isConnected) {
      onError(ApiComponent.noNetworkMessage);
      return;
    }
    print(path);
    print(queryParams);
    try {
      Response<dynamic> response =
          await Dio().request<dynamic>(ApiComponent.baseUrl+path, queryParameters: queryParams);
      print("response $response");
      onSuccess(response.data);
    } on DioError catch (error) {
      onError(error.message);
    } catch (error) {
      onError(error.toString());
    }
  }

  static getIngredients(
      {ValueChanged<String> onError,
      ValueChanged<List<Ingredient>> onSuccess}) async {
    request(ApiComponent.getIngredients, onSuccess: (dynamic result) {
//      var listResult = result as List<dynamic>;
//      print('listResult $listResult');
      if (result is List<dynamic>) {
        print("result is list");
        List<Ingredient> ingredients =
            result.map((item) => Ingredient.fromJson(item)).toList();
        onSuccess(ingredients);
      } else {
        print("result is not list");
      }
    }, onError: onError);
  }

  static getRecipes(List<String> ingredients,
      {ValueChanged<String> onError,
      ValueChanged<List<Recipe>> onSuccess}) async {
    String _ingredients = ingredients.join(",");

    Map<String, dynamic> queryParams = {
      ApiComponent.getIngredients: _ingredients
    };

    request(ApiComponent.getRecipes, queryParams: queryParams,
        onSuccess: (dynamic result) {
      if (result is List<dynamic>) {
        List<Recipe> recipes =
            result.map((item) => Recipe.fromJson(item)).toList();
        onSuccess(recipes);
      }
    }, onError: onError);
  }
}
