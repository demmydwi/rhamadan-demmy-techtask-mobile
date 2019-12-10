# Mobile Technical Task
Apps for Lunch Recipes Suggestion

## User Story
As a User, User would like to get a set of recipes what User can have for lunch today based on the contents of my fridge so
that User can quickly decide what User will be having.

__Acceptance Criteria__
- [x] Input user preference lunch date, or it would be today date if it is empty
- [x] Request to the `/ingredients` endpoint, receive a JSON response of the ingredients.
- [x] Select some ingredients to get the recipes.
- [x] User should not be able to select ingredients which past its `use-by`date, in this case i hide ingredients from list.
- [x] Sort ingredients by (less fresh) last.
- [x] When user select some ingredients, request to the `/recipes` endpoint with
 `?ingredients=<title-1>,<title-2>,<title-n>` as a query parameter.
- [x] Get the result of the available recipes, show list of the recipes as well as the ingredients
 to make per recipes.

__Additional Criteria__
- [x] Fork this Flutter project as a base for your project.
- [x] The application must have more than one screen and navigation (laucher page, ingredients page, and recipes page).
- [ ] The application SHOULD contain unit / widget tests (e.g. using the flutter_test package).
- [x] The application MUST be completed using an OOP approach.
- [x] Any dependencies MUST be installed using dependency management tools (Pub for Flutter).
- [x] Any installation, build steps, testing and usage instructions MUST be provided in a `README.md`
file in the root of the application. __Do not use a autogenerated file__
