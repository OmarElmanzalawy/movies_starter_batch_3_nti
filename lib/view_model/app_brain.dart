import 'package:flutter/widgets.dart';
import 'package:movies_starter/models/movie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Global object
final appBrain = AppBrain();

class AppBrain {

  ValueNotifier<List<MovieModel>> movies = ValueNotifier([]);
  ValueNotifier<List<MovieModel>> favoriteMovies = ValueNotifier([]);
  ValueNotifier<bool> isDarkMode = ValueNotifier(true);
  Map<int,String> genresMap = {};
  int currentPage = 1;

  Future<void> initializeApp()async{

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final savedTheme = await prefs.getBool("theme");

    isDarkMode.value = savedTheme ?? true;

  }

  void toggleTheme()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    
    isDarkMode.value = !isDarkMode.value;
    await prefs.setBool("theme", isDarkMode.value);
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