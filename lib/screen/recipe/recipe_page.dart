import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_task/provider/recipe_provider.dart';
import 'package:tech_task/provider/state.dart';
import 'package:tech_task/screen/recipe/recipe_item_view.dart';

class RecipePage extends StatefulWidget {
  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Recipes"),
        ),
        body: Consumer<RecipeProvider>(builder: (_, _provider, __) {
          if (_provider.state == ProviderState.onEmpty) {
            return Center(
              child: Text(
                "Recipes not found",
                style: Theme.of(context).textTheme.title,
              ),
            );
          } else if (_provider.state == ProviderState.onError) {
            return Center(
              child: Text(
                _provider.errMessage,
                style: Theme.of(context).textTheme.title,
              ),
            );
          }
          return ListView(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
            children: _provider.recipes
                .map((item) => InkWell(
                    onTap: () {
//                      _provider.(item);
                    },
                    child: RecipeItemView(item)))
                .toList(),
          );
        }));
  }
}
