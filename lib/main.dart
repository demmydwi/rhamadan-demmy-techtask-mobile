import 'package:flutter/material.dart';
import 'package:tech_task/component/color.dart';
import 'package:tech_task/screen/launcher/launch_page.dart';

void main() => runApp(MyApp());

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
        primaryColorBrightness: Brightness.light,
        primaryIconTheme: IconThemeData(color: Colors.white, ),
        primaryTextTheme: TextTheme(),
        accentTextTheme: TextTheme(),
      ),
      home: LaunchPage(),
    );
  }
}
