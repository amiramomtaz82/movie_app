import 'package:flutter/material.dart';
import 'package:movie_app/core/utilis/app_assets.dart';
import 'package:movie_app/core/utilis/app_routes.dart';
import 'package:movie_app/domain/models/movieDetails_model.dart';

import '../../../core/utilis/app_colors.dart';
import '../../../core/utilis/app_text_style.dart';


class MovieImage extends StatelessWidget {
 final MovieDetailsModel movie;


 MovieImage({Key? key,required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(onTap: (){
        Navigator.push(context,AppRoutes.movieDetails(movie.id!));
      },
        child: Stack( children: [
         ClipRRect(borderRadius: BorderRadius.circular(16)
            ,child:
            Image(
              image: movie.largeCoverImage != null
                  ? NetworkImage(movie.largeCoverImage!)
                  : const AssetImage(Appassets.noImage) as ImageProvider,
              height: 300,

              fit: BoxFit.cover,
            ),
          ),
          Align(alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height:28,width: 58,
                decoration: BoxDecoration(
                    color: Appcolors.darkGrey.withAlpha(200),
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Row(children: [
                    Text("${movie.rating}", style:Appstyles.white16Reg ,),Spacer(),
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
