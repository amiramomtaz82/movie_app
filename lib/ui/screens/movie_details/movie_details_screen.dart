import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utilis/app_assets.dart';
import 'package:movie_app/core/utilis/app_colors.dart';
import 'package:movie_app/core/utilis/app_constant.dart';
import 'package:movie_app/core/utilis/app_routes.dart';
import 'package:movie_app/core/utilis/app_text_style.dart';
import 'package:movie_app/ui/app_widget/custome_elevated_button.dart';
import 'package:movie_app/ui/presentaion/movie_cubit/movieDetails_cubit.dart';
import 'package:movie_app/ui/screens/home/movie_image.dart';
import 'package:movie_app/ui/screens/movie_details/CastCard.dart';
import 'package:movie_app/ui/screens/movie_details/genger_card.dart';
import 'package:movie_app/ui/screens/movie_details/screen_shots_view.dart';
import 'package:movie_app/ui/screens/movie_details/similar_view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/di/di.dart';
import '../../../core/utilis/resource.dart';
import '../../../domain/models/movieDetails_model.dart';

import '../../presentaion/movie_cubit/movie_cubit_state.dart';
import '../play_movie.dart';

class MovieDetailsScreen extends StatefulWidget {
String movieId;
 MovieDetailsScreen({Key? key,required this.movieId}) : super(key: key);

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  MovieDetailsCubit movieDetailsCubit=getIt<MovieDetailsCubit>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieDetailsCubit.loadMovieDetails(widget.movieId);
    movieDetailsCubit.loadSimilarMovies(widget.movieId);
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => movieDetailsCubit,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Appcolors.black,
          body: BlocBuilder<MovieDetailsCubit,MovieDetailsState>
          (builder :(context,state){
            if (state.movieDetails.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
           else if (state.movieDetails.isError) {
              return Center(
                child: Text(
              state.movieDetails.errorMessage ?? "Error",
                  style: const TextStyle(color: Colors.white),
                ),
              );
            }
           else if (state.movieDetails.status == ApiStatus.success &&
                state.movieDetails.data != null){
              final movie = state.movieDetails.data!;
              final similarMovies = state.similarMovies.data ?? [];
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*.7,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          movie.largeCoverImage != null
                              ? Image.network(movie.largeCoverImage!,height: double.infinity,width: double.infinity,fit: BoxFit.cover,)
                              : Image.asset(Appassets.noImage),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Appcolors.black.withOpacity(0.5),
                                  // Start with slight opacity
                                  Colors.black.withOpacity(1),
                                ],
                              ),
                            ),
                          ),
                
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Image.asset(Appassets.arrowback),
                                  Spacer(),
                                  IconButton(
                                    onPressed: () {
                
                
                                    },
                                    icon: Image.asset(Appassets.mark),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: InkWell(onTap: (){
                
                              if (movie.url != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PlayMovie(url: movie.url!),
                                  ),
                                );
                              }
                
                            },
                
                                child: Image.asset(Appassets.group21_1)),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                                  child: Text(
                                    movie.titleEnglish??"",
                                    style: Appstyles.white24Med,
                                    textAlign: TextAlign.center,
                                  ),
                                ), SizedBox(height: 20),
                                Text("${movie.year ?? 0}",style: Appstyles.white20bold,),
                                SizedBox(height: 20,),
                                CustomElevatedButton(onClick: (){
                
                                  if (movie.url != null) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PlayMovie(url: movie.url!),
                                      ),
                                    );
                                  }
                
                                },
                                  text: Appstrings.watchNow,backgroundColor: Appcolors.red,
                                  textColor: Appcolors.white,
                                  borderColor: Appcolors.red
                                  ,
                                )
                              ],
                            ),
                          ),
                
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16)
                              ,color: Appcolors.darkGrey),
                          height:50 ,
                          width: 120,
                          child:
                
                
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(Appassets.heart),
                
                              Text("${movie.likeCount??0}",style: Appstyles.white24Med,)
                
                            ],),
                        ),
                
                        Spacer(),
                
                
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16)
                              ,color: Appcolors.darkGrey),
                          height:50 ,
                          width: 120,
                          child:
                
                
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(Appassets.watch),
                
                              Text("${movie.runtime?? 0}",style: Appstyles.white24Med,)
                
                            ],),
                        ),
                
                        Spacer(),
                
                
                
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16)
                              ,color: Appcolors.darkGrey),
                          height:50 ,
                          width: 120,
                          child:
                
                
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(Appassets.star),
                
                              Text("${movie.rating??0.0}",style: Appstyles.white24Med,)
                
                            ],),
                        ),
                
                      ],),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(width: double.infinity,
                          child: Text(Appstrings.screenShot,
                            style: Appstyles.white20bold,
                            textAlign: TextAlign.left,)),
                    ),
                    SizedBox(height: 10,),
                    movie.mediumScreenshotImage1 != null
                        ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                          ClipRRect(borderRadius: BorderRadius.circular(16),
                              child: Image.network(movie.mediumScreenshotImage1!)),
                        )
                        : Image.asset(Appassets.noImage),
                    movie.mediumScreenshotImage2 != null
                        ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                          ClipRRect(borderRadius: BorderRadius.circular(16),
                              child: Image.network(movie.mediumScreenshotImage2!)),
                        )
                        : Image.asset(Appassets.noImage),
                    movie.mediumScreenshotImage3 != null
                        ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(borderRadius: BorderRadius.circular(16),
                              child: Image.network(movie.mediumScreenshotImage3!)),
                        )
                        : Image.asset(Appassets.noImage),
        
        
                
        
        
                    SizedBox(height: 20,),
                
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(width: double.infinity,
                          child: Text(Appstrings.similar,
                            style: Appstyles.white20bold,
                            textAlign: TextAlign.left,)),
                    ),
                    SizedBox(height: 10,),
                    SizedBox(height: 700,
                      child:
        
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(physics:NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: .4,
                                mainAxisExtent:300,
                                crossAxisCount: 2
                            )
                            , itemCount: 4,
                            itemBuilder: (context,index) {
        
                            return  SimilarView(movie: similarMovies[index]);
                            } ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(width: double.infinity,
                        child: Text(Appstrings.summary,
                          style: Appstyles.white20bold,
                          textAlign: TextAlign.left,),
                
                      ),
                    ),SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(width: double.infinity,child:
                      Text(movie.descriptionIntro??"",                maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                        style: Appstyles.white14regular,
                        textAlign: TextAlign.left,),),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(width: double.infinity,
                          child: Text(Appstrings.cast,
                            textAlign: TextAlign.left,
                            style: Appstyles.white20bold,)),
                    ),
                    SizedBox(height: 20,),
                    SizedBox(height: 300,
                        child: ListView.builder(
                          itemCount: movie.cast?.length??0,
                          itemBuilder: (context,index){
                            final castList = movie.cast ?? [];
                
                
                
                            return CastCard(cast: castList[index],);},))
                
                    ,SizedBox(height: 20,),
                    Container(width: double.infinity,
                        child: Text(
                          Appstrings.genres,style: Appstyles.white20bold,textAlign: TextAlign.left,)),
                
                    SizedBox(height: 150
                      ,child:
                      GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: .5,
                            mainAxisExtent: 50,
                            crossAxisCount: 3,
                
                          ),
                          itemCount: movie.genres?.length??0,
                          itemBuilder: (context,index)=>
                              gengerCard(movie.genres?[index]??"")
                      ),),
                    SizedBox(height: 50,)
                
                  ],
                ),
              );
        
            }
            else {
              print("-----------------------------");
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
        
        }
        
          ),
        ),
      ),
    );
  }
}
