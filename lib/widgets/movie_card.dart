import 'package:flutter/material.dart';
import 'package:movies_starter/models/movie_model.dart';
import 'package:movies_starter/view_model/app_brain.dart';
import 'package:movies_starter/widgets/category_capsule.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key,required this.model});

  final MovieModel model;

  @override
  Widget build(BuildContext context) {
    return  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Hero(
                    tag: model.id,
                    child: Image.network(
                      "https://image.tmdb.org/t/p/w500${model.posterPath}",
                      width: 80,
                      height: 120,
                      fit: BoxFit.cover,
                      ),
                  ),
                ),
                  const SizedBox(width: 8,),
                  Expanded(
                    child: Container(
                      // color: Colors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(model.title,style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                          const SizedBox(height: 8,),
                          Row(
                            children: [
                              Icon(Icons.star,color: Colors.amber,),
                              Text("${model.voteAverage.toStringAsFixed(1)}/10",style: TextStyle(fontWeight: FontWeight.bold),)
                            ],
                          ),
                          const SizedBox(height: 8,),
                          Wrap(
                            spacing: 8,
                            runSpacing: 10,
                            children: [
                              CategoryCapsule(label: "Action"),
                              CategoryCapsule(label: "Comedy"),
                            ],
                          ),
                          // const SizedBox(height: 8,),
                          Row(
                            children: [
                              Icon(Icons.access_time,color: Colors.teal,),
                              const SizedBox(width: 3,),
                              Text(model.releaseDate),
                              Spacer(),
                              IconButton(onPressed: (){
                                appBrain.addToFavorites(model);
                              }, icon: Icon(Icons.favorite_outline))
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                              ],
            ),
          );
  }
}


// nti_course
// test12345