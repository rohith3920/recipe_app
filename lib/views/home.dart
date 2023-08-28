import 'package:flutter/material.dart';
import 'package:receipe_app/models/recipe.dart';
import 'package:receipe_app/models/recipe_api.dart';
import 'package:receipe_app/views/widgets/recipe_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Recipe> _recipe;
  bool _isloading = true;

  @override
  void initState() {
    getRecipe();
    super.initState();
  }

  Future<void> getRecipe() async {
    _recipe = await RecipeApi.getRecipe();
    setState(() {
      _isloading = false;
    });
    print("my name is + $_recipe");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.restaurant_menu),
            SizedBox(
              width: 10,
            ),
            Text("Food Recipe"),
          ]),
        ),
        body: _isloading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _recipe.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                      title: _recipe[index].name,
                      cookTime: _recipe[index].totalTimes,
                      rating: _recipe[index].rating.toString(),
                      thumbnailUrl: _recipe[index].images);
                },
              ));
  }
}
