import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tech_task/component/color.dart';
import 'package:tech_task/component/shimmer.dart';
import 'package:tech_task/component/state.dart';
import 'package:tech_task/function/date.dart';
import 'package:tech_task/model/ingredient.dart';
import 'package:tech_task/network/api_manager.dart';
import 'package:tech_task/provider/ingredient_provider.dart';
import 'package:tech_task/provider/recipe_provider.dart';
import 'package:tech_task/provider/state.dart';
import 'package:tech_task/screen/recipe/recipe_page.dart';

import 'ingredient_item_view.dart';

class IngredientPage extends StatefulWidget {
  @override
  _IngredientPageState createState() => _IngredientPageState();
}

class _IngredientPageState extends MyState<IngredientPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget buildHeader(String selectedDate) {
    return Container(
      key: ValueKey("ingredient_header"),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), border: Border.all()),
      height: 56,
      alignment: Alignment.center,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Text(
            selectedDate,
            style: Theme.of(context).textTheme.body1,
          )),
          Icon(Icons.arrow_drop_down)
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }

  Widget buildContent(IngredientProvider _provider) {
    if (_provider.state == ProviderState.onInit) {
      _provider.getIngredients();
      return MyShimmer(
        margin: EdgeInsets.only(top: 16, left: 16),
      );
    } else if (_provider.state == ProviderState.onEmpty) {
      return Center(
        child: Text(
          "Ingredients not found",
          style: Theme.of(context).textTheme.title,
        ),
      );
    } else if (_provider.state == ProviderState.onError) {
      return Center(
        child: Text(_provider.errMessage),
      );
    }
    return SizedBox.expand(
      child: RefreshIndicator(
        onRefresh: () async {
          _provider.refresh();
        },
        child: ListView(
          padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
          children: _provider.ingredients
              .map((item) => InkWell(
                  onTap: () {
                    _provider.selectIngredient(item);
                  },
                  child: IngredientItemView(item)))
              .toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          key: ValueKey("ingredient_app_bar"),
          title: Text("Ingredients"),
        ),
        body: Consumer<IngredientProvider>(
          builder: (_, _provider, __) {
            return SafeArea(
              key: ValueKey("ingredient_body"),
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () async {
                      DateTime pickedDate = await showDatePicker(
                          context: context,
                          initialDate: _provider.selectedDate,
                          firstDate: DateTime.now().add(Duration(days: -90)),
                          lastDate: DateTime.now().add(Duration(days: 90)));
                      if (pickedDate != null) {
                        _provider.selectedDate = pickedDate;
                      }
                    },
                    child:
                        buildHeader(userFormat.format(_provider.selectedDate)),
                  ),
                  Expanded(key: ValueKey("ingredient_content"),child: buildContent(_provider)),
                  buttonCheckRecipe(_provider.selectedIngredients)
                ],
              ),
            );
          },
        ));
  }

  Widget buttonCheckRecipe(List<Ingredient> _ingredients) {
    return Consumer<RecipeProvider>(builder: (_, _provider, __) {
      return Container(
        key: ValueKey("ingredient_button"),
          height: 50,
          width: double.infinity,
          margin: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: MaterialButton(
            minWidth: double.infinity,
            height: 50,
            onPressed: _ingredients.isEmpty || _provider.state == ProviderState.onLoading
                ? () {}
                : () {
                    _provider.getRecipes(
                        ingredients: _ingredients,
                        onSuccess: () {
                          push(RecipePage());
                        });
                  },
            child: _provider.state == ProviderState.onLoading
                ? CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                : Text(
                    "CHECK RECIPES",
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .copyWith(color: Colors.white),
                  ),
            color:
                _ingredients.isEmpty ? Colors.grey.shade400 : MyColor.secondary,
          ));
    });
  }
}
