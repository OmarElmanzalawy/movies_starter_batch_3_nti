import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:movies_starter/models/movie_model.dart';
import 'package:movies_starter/view_model/app_brain.dart';

class ApiService {

  
  static final String apiKey = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNThlZDI2ODU4ZjA4ODYxZDYwZGNkNjdhM2RmYzZmYyIsIm5iZiI6MTc2MDQ0MjA1NC40NzEsInN1YiI6IjY4ZWUzNmM2ODhiYjBlNzg3NTI4MmIyMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.n8uHiJgPaJ_EuF9rz_CBsktOC3wimTXVZs6ZwF0Oguk";

  

  static Future<void> fetchPopularMovies({int page = 1})async{

    final String endpoint = "https://api.themoviedb.org/3/movie/popular?language=en-US&page=$page";

    final Map<String,String> header = {
    "Authorization": "Bearer $apiKey"
  };

  final url = Uri.parse(endpoint);

  final response =  await http.get(
    url,
    headers: header
    );

    // print(response.body);
    // print(response.statusCode);

    if(response.statusCode == 200){
      print(response.body.runtimeType);
      //deserialization
      final mapResponse = jsonDecode(response.body);
      print(mapResponse.runtimeType);

      final results = mapResponse["results"] as List;
      final fetchedMovies = results.map((map){
        return MovieModel(
          adult: map["adult"],
          backdropPath: map["backdrop_path"],
          id: map["id"],
          genreIds: map["genre_ids"],
          originalLanguage: map["original_language"],
          originalTitle: map["original_title"],
          overview: map["overview"],
          popularity: map["popularity"],
          posterPath: map["poster_path"],
          releaseDate: map["release_date"],
           title: map["title"],
            voteAverage: map["vote_average"],
             voteCount: map['vote_count']);
      }).toList();

      appBrain.movies.value = [...appBrain.movies.value, ...fetchedMovies];

      print(fetchedMovies.length);

      appBrain.currentPage += 1;
    }

  }

  static void fetchMovieGenres()async{

    final endpoint = "https://api.themoviedb.org/3/genre/movie/list";

     final Map<String,String> header = {
    "Authorization": "Bearer $apiKey"
  };

  final url = Uri.parse(endpoint);

  final response =  await http.get(
    url,
    headers: header
    );

    // print(response.body);

    if(response.statusCode == 200){

      final mapResponse = jsonDecode(response.body);

      final genresList = mapResponse["genres"] as List;

      Map<int,String> genreMap = {};

      /* {
      28: Action

      }
    
    */

      for(var genre in genresList){
        genreMap[genre["id"]] = genre["name"];
      }

      print(genreMap);

      appBrain.genresMap = genreMap;

    }

  }


}