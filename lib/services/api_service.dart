import 'dart:io';

import 'package:http/http.dart' as http;

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

    print(response.body);
    print(response.statusCode);

  }


}