import 'package:flutter/material.dart';
import 'package:movies_starter/screens/movie_details_screen.dart';
import 'package:movies_starter/services/api_service.dart';
import 'package:movies_starter/view_model/app_brain.dart';
import 'package:movies_starter/widgets/movie_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
   ApiService.fetchPopularMovies();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Movies"),
        centerTitle: false,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined)),
          IconButton(onPressed: (){}, icon: Icon(Icons.dark_mode)),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: appBrain.movies,
        builder:(context, value, child) {
          return ListView.builder(
          itemCount: appBrain.movies.value.length,
          itemBuilder:(context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) => MovieDetailsScreen(
                  model: appBrain.movies.value[index],
                ),));
              },
              child: MovieCard(
                model: appBrain.movies.value[index],
              ),
            );
          },
          );
        } 
      )
    );
  }
}