import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_task/component/color.dart';
import 'package:tech_task/provider/ingredient_provider.dart';
import 'package:tech_task/screen/launcher/launch_page.dart';

void main() => runApp(MultiProvider(
      child: MyApp(),
      providers: [
        ChangeNotifierProvider(
          create: (_) => IngredientProvider(),
        ),
      ],
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipes form ingredients',
      theme: ThemeData(
        primaryColor: MyColor.primary,
        primaryColorDark: MyColor.primaryDark,
        primaryColorLight: MyColor.primaryLight,
        backgroundColor: Colors.white,
        accentColor: MyColor.secondary,
        accentColorBrightness: Brightness.light,
        primaryColorBrightness: Brightness.dark,
        primaryIconTheme: IconThemeData(
          color: Colors.white,
        ),
        primaryTextTheme: TextTheme(),
        accentTextTheme: TextTheme(),
      ),
      home: LaunchPage(),
    );
  }
}
