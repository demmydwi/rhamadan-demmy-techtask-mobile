import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tech_task/model/ingredient.dart';
import 'package:tech_task/provider/ingredient_provider.dart';


class IngredientItemView extends StatelessWidget {
  final Ingredient _ingredient;

  IngredientItemView(this._ingredient);

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
                  _ingredient.title,
                  style: Theme.of(context).textTheme.title,
                ),
                Padding(padding: EdgeInsets.only(top: 6)),
                Text(
                  _ingredient.formattedDate,
                  style: Theme.of(context).textTheme.body1,
                ),
              ],
            ),
          ),
          Consumer<IngredientProvider>(builder: (_, _provider, __) {
            var isSelected =
            _provider.selectedIngredients.contains(_ingredient);
            return Icon(
                isSelected ? Icons.check_box : Icons.check_box_outline_blank);
          })
        ],
      ),
    );
  }
}
