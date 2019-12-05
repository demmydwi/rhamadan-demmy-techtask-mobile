import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tech_task/component/shimmer.dart';
import 'package:tech_task/model/ingredient.dart';
import 'package:tech_task/network/api_manager.dart';
import 'package:tech_task/provider/ingredient_provider.dart';

class IngredientPage extends StatefulWidget {
  @override
  _IngredientPageState createState() => _IngredientPageState();
}

class _IngredientPageState extends State<IngredientPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ingredients"),
        ),
        body: Consumer<IngredientProvider>(
          builder: (_, _provider, __){
            if (_provider.state == IngredientState.onInit) {
              _provider.getIngredients();
              return MyShimmer(margin: EdgeInsets.only(top: 16, left: 16),);
            } else if (_provider.state == IngredientState.onEmpty) {
              return Center(child: Text("Is Empty"),);
            } else if (_provider.state == IngredientState.onError) {
              return Center(child: Text(_provider.errMessage),);
            }
            return SizedBox.expand(
              child: RefreshIndicator(
                onRefresh: () async {
                  _provider.refresh();
                },
                child: SafeArea(
                  child: ListView(
                    padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
                    children: _provider.ingredients.map( (item) => IngredientItemView(item) ).toList(),
                  ),
                ),
              ),
            );
          },
        ));
  }
}


class IngredientItemView extends StatelessWidget {

  final Ingredient _ingredient;

  IngredientItemView(this._ingredient);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4, top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 40,
            width: 40,
            child: SvgPicture.asset("asset/ingredient.svg")
          ),
          Padding(padding: EdgeInsets.only(left: 12)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(_ingredient.title, style: Theme.of(context).textTheme.title,),
                Padding(padding: EdgeInsets.only(top: 6)),
                Text(_ingredient.formattedDate, style: Theme.of(context).textTheme.body1,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
