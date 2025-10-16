import 'package:flutter/widgets.dart';
import 'package:movies_starter/models/movie_model.dart';

//Global object
final appBrain = AppBrain();

class AppBrain {

  ValueNotifier<List<MovieModel>> movies = ValueNotifier([]);

}