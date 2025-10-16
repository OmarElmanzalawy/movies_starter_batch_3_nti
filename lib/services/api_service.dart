import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:movies_starter/models/movie_model.dart';

class ApiService {

  static final String endpoint = "https://api.themoviedb.org/3/movie/popular";
  static final String apiKey = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNThlZDI2ODU4ZjA4ODYxZDYwZGNkNjdhM2RmYzZmYyIsIm5iZiI6MTc2MDQ0MjA1NC40NzEsInN1YiI6IjY4ZWUzNmM2ODhiYjBlNzg3NTI4MmIyMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.n8uHiJgPaJ_EuF9rz_CBsktOC3wimTXVZs6ZwF0Oguk";

  

  static void fetchPopularMovies()async{

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

      print(fetchedMovies.length);
    }

  }


}