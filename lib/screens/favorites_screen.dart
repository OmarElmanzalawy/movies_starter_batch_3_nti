import 'package:flutter/material.dart';
import 'package:movies_starter/view_model/app_brain.dart';
import 'package:movies_starter/widgets/movie_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorite Movies"),),
      body:
       ValueListenableBuilder(
        valueListenable: appBrain.favoriteMovies,
         builder:(context, value, child) {
           return  appBrain.favoriteMovies.value.length == 0 ?
      Center(
        child: Text("No movies added to favorite yet"),
      ): ListView.builder(
          itemCount: appBrain.favoriteMovies.value.length,
          itemBuilder:(context, index) {
            return MovieCard(model: appBrain.favoriteMovies.value[index]);
          },
          );
         } 
       ),
    );
  }
}