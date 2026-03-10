import 'package:flutter/material.dart';
import 'package:movie_app/core/utilis/app_assets.dart';
import 'package:movie_app/domain/models/movieDetails_model.dart';

import '../../../core/utilis/app_colors.dart';
import '../../../core/utilis/app_routes.dart';
import '../../../core/utilis/app_text_style.dart';


class SimilarView extends StatelessWidget {
MovieDetailsModel movie;

  SimilarView({Key? key,required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  InkWell(onTap: (){
      Navigator.push(context,AppRoutes.movieDetails(movie.id!));
    },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Stack( children: [
          ClipRRect(borderRadius: BorderRadius.circular(16),
            child: movie.mediumCoverImage != null
                ? Image.network(movie.mediumCoverImage!,height: 300,
              width: double.infinity,
              fit: BoxFit.cover,)
                : Image.asset(Appassets.noImage),


            ),

          Align(alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height:28,width: 65,
                decoration: BoxDecoration(
                    color: Appcolors.darkGrey.withAlpha(200),
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(children: [
                    Text("${movie.rating}", style:Appstyles.white20bold ,),Spacer(),
                    Icon(Icons.star,color: Appcolors.yellow,size: 15,)
                  ],),
                ),

              ),
            ),
          ),
        ],),
      ),
    );
  }
}
