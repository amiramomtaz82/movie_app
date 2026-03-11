import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/models/movieDetails_model.dart';
import 'package:movie_app/ui/presentaion/movie_cubit/home_tab_cubit/cubit.dart';
import 'package:movie_app/ui/presentaion/movie_cubit/home_tab_cubit/state.dart';

import '../../../../core/utilis/app_assets.dart';
import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_routes.dart';

class BuildCrouseSlide extends StatefulWidget {

  const BuildCrouseSlide({Key? key,}) : super(key: key);

  @override
  _BuildCrouseSlideState createState() => _BuildCrouseSlideState();
}

class _BuildCrouseSlideState extends State<BuildCrouseSlide> {
  late MovieDetailsModel selectedMovie;
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<HomeCubit,HomeState>(builder: (context,state){
      final popular
      = state.moviesByGenre["popularInterests"];

      if (popular == null || popular.isLoading) {
        return const SizedBox(
          height: 650,
          child: Center(child: CircularProgressIndicator()),
        );
      }



      if (popular.isError) {
        return Text(popular.errorMessage ?? "");
      }

      final movies = popular.data ?? [];


      if (movies.isEmpty) {
        return const SizedBox();
      }

      return Container( height: 650, width: double.infinity,
        child: Stack(children: [
          Image.network(movies[currentIndex].mediumCoverImage??"", height: double.infinity,
            width: double.infinity, fit: BoxFit.cover,
          ),
          Container(decoration: BoxDecoration(gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Appcolors.black.withOpacity(0.7),
// Start with slight opacity
              Colors.black.withOpacity(.9,)
            ],
          ),


          )
          ),
          Align(alignment: Alignment.topCenter
              , child: Column(
                children: [SizedBox(height: 30,),
                  Image.asset(Appassets.availableNow),
                ],
              )),

          Align(alignment: Alignment.center,
            child: Container(height: 500,
                child: CarouselSlider.builder(

                  itemCount: movies.length,
                  itemBuilder: (context, index, realIndex) {
                    return Center(
                      child: ClipRRect(borderRadius: BorderRadius.circular(16),
                        child: InkWell(onTap: () {
                          Navigator.push(context,AppRoutes.movieDetails(movies[index].id!));
                        },
                          child: Image.network(
                            movies[index].mediumCoverImage??"",
                            height: 350,
                            width: 250,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },


                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.5
                    ,
                    autoPlay: false,
                    enlargeCenterPage: true,
                    viewportFraction: 0.7,

                  ),

                )
            ),
          ),

          Align(alignment: Alignment.bottomCenter,
              child: Image.asset(Appassets.watchNow))

        ],),


      );
    });
  }
}






