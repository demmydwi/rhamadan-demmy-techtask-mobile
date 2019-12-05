import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_task/component/state.dart';
import 'package:tech_task/screen/ingredient/ingredient_page.dart';

class LaunchPage extends StatefulWidget {
  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends MyState<LaunchPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((_) {
      present(IngredientPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SvgPicture.asset(
            "asset/main_icon.svg",
            height: 120,
          ),
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: Text(
              "My Recipes",
              style: Theme.of(context).textTheme.title,
            ),
          )
        ]),
      ),
    );
  }
}
