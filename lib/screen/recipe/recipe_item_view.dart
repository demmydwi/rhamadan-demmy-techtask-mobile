import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tech_task/model/recipe.dart';
import 'package:tech_task/provider/recipe_provider.dart';

class RecipeItemView extends StatelessWidget {
  final Recipe _recipe;

  RecipeItemView(this._recipe);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4, top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              height: 40,
              width: 40,
              child: SvgPicture.asset("asset/ingredient.svg")),
          Padding(padding: EdgeInsets.only(left: 12)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _recipe.title,
                  style: Theme.of(context).textTheme.title,
                ),
                Padding(padding: EdgeInsets.only(top: 6)),
                Text(
                  _recipe.ingredientsString,
                  style: Theme.of(context).textTheme.body1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
