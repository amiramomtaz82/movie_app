import 'package:flutter/material.dart';
import 'package:movie_app/core/utilis/app_colors.dart';
import 'package:movie_app/core/utilis/app_text_style.dart';
import 'package:movie_app/domain/models/movieDetails_model.dart';
import 'package:movie_app/ui/screens/home/movie_image.dart';

class MovieListGenre extends StatelessWidget {
  List <MovieDetailsModel > movies;
  String title;
  MovieListGenre({Key? key, required this.movies,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(width: double.infinity,
            child: Row(
              children: [
                Text(title,style: Appstyles.white20bold,textAlign: TextAlign.left,),
                Spacer(), 
                Text("see more",style: Appstyles.yellow14regular,),
                Icon(Icons.arrow_forward,color: Appcolors.yellow,size: 15,)
              ],
            )),
      ),
        SizedBox(height: 10,),
        SizedBox(height: 300,
          child: ListView.builder(scrollDirection:Axis.horizontal,
              itemCount: movies.length,
              itemBuilder:(context,index)=>
                  MovieImage(movie: movies[index],)
          ),
        ),SizedBox(height: 30,)
      ],
    );
  }
}
