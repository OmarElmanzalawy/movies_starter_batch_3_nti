import 'package:flutter/material.dart';
import 'package:movies_starter/widgets/movie_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      body: Column(
        children: [
          //Moive Card UI
         MovieCard()
        ],
      )
    );
  }
}