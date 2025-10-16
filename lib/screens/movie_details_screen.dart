import 'package:flutter/material.dart';
import 'package:movies_starter/models/movie_model.dart';
import 'package:movies_starter/widgets/category_capsule.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key,required this.model});

  final MovieModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context);
    print(size.size.height);
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Hero(
                    tag: model.id,
                    child: Image.network("https://image.tmdb.org/t/p/w500${model.backdropPath}",
                    height: size.size.height * 0.45,
                    width: size.size.width,
                    fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(12),
                      height: size.size.height * 0.6,
                      width: size.size.width,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        borderRadius: BorderRadius.circular(25)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(model.title,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                          const SizedBox(height: 12,),
                          Row(
                            children: [
                              Icon(Icons.star,color: Colors.amber,size: 30,), 
                              Text("${model.voteAverage.toStringAsFixed(1)}/10",style: TextStyle(fontSize: 16),),
                              Spacer(),
                              Text(model.releaseDate)
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Wrap(
                            spacing: 10,
                            children: [
                              CategoryCapsule(label: "Action"),
                              CategoryCapsule(label: "Thriller"),
                            ],
                          ),
                          const SizedBox(height: 30,),
                          Text(model.overview,style: TextStyle(fontSize: 17),)
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 35,
                    left: 15,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: IconButton(onPressed: (){
                        Navigator.pop(context);
                      }, icon: Icon(Icons.arrow_back_ios)),
                    )
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}