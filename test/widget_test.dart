// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';
import 'package:tech_task/function/date.dart';
import 'package:tech_task/model/ingredient.dart';
import 'package:tech_task/provider/ingredient_provider.dart';
import 'package:tech_task/provider/recipe_provider.dart';
import 'package:tech_task/screen/ingredient/ingredient_page.dart';
import 'package:tech_task/screen/launcher/launch_page.dart';
import 'package:tech_task/screen/recipe/recipe_page.dart';

void main() {
  testWidgets(
      "Launch page has label 'My Recipes' & image with key `launcher_image`",
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: LaunchPage(
        ignorePush: true,
      ),
    ));
    // find my recipes label
    final imageLauncher = find.byKey(ValueKey("launcher_image"));
    final titleLauncher = find.text('My Recipes');
    expect(imageLauncher, findsOneWidget);
    expect(titleLauncher, findsOneWidget);
  });

  testWidgets(
      "Ingredient page has header, appbar, body, content, button, title, datepicker",
      (WidgetTester tester) async {
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => IngredientProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => RecipeProvider(),
        ),
      ],
      child: MaterialApp(
        home: IngredientPage(),
      ),
    ));

    final header = find.byKey(ValueKey("ingredient_header"));
    final appBar = find.byKey(ValueKey("ingredient_app_bar"));
    final body = find.byKey(ValueKey("ingredient_body"));
    final content = find.byKey(ValueKey("ingredient_content"));
    final button = find.byKey(ValueKey("ingredient_button"));
    final title = find.text('Ingredients');

    expect(header, findsOneWidget);
    expect(appBar, findsOneWidget);
    expect(body, findsOneWidget);
    expect(content, findsOneWidget);
    expect(button, findsOneWidget);
    expect(title, findsOneWidget);

    var dateTimeNowString = userFormat.format(DateTime.now());
    final datePicker = find.text(dateTimeNowString);

    expect(datePicker, findsOneWidget);
  });

  testWidgets(
      "Recipe page has appbar, body, content, title",
          (WidgetTester tester) async {
        await tester.pumpWidget(MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => IngredientProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => RecipeProvider(),
            ),
          ],
          child: MaterialApp(
            home: RecipePage(),
          ),
        ));

        final appBar = find.byKey(ValueKey("recipe_app_bar"));
        final body = find.byKey(ValueKey("recipe_body"));
        final content = find.byKey(ValueKey("recipe_content"));
        final title = find.text('Recipes');

        expect(appBar, findsOneWidget);
        expect(body, findsOneWidget);
        expect(content, findsOneWidget);
        expect(title, findsOneWidget);
      });
}
