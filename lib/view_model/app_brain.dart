import 'package:flutter/widgets.dart';
import 'package:movies_starter/models/movie_model.dart';

//Global object
final appBrain = AppBrain();

class AppBrain {

  ValueNotifier<List<MovieModel>> movies = ValueNotifier([]);
  ValueNotifier<List<MovieModel>> favoriteMovies = ValueNotifier([]);
  ValueNotifier<bool> isDarkMode = ValueNotifier(true);

  void toggleTheme(){
    isDarkMode.value = !isDarkMode.value;
  }

  void addToFavorites(MovieModel movies){

    //Modify list in place
    // favoriteMovies.value.add(movies);

    //Returns new list object
    favoriteMovies.value = [...favoriteMovies.value,movies];
  }

  void removeFromFavorites(MovieModel model){
    favoriteMovies.value = favoriteMovies.value.where((currentMovie)=> model.id != currentMovie.id).toList();
  }

}