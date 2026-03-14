import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utilis/app_assets.dart';
import 'package:movie_app/core/utilis/app_colors.dart';
import 'package:movie_app/core/utilis/app_constant.dart';
import 'package:movie_app/core/utilis/app_routes.dart';
import 'package:movie_app/core/utilis/app_text_style.dart';
import 'package:movie_app/domain/models/movieDetails_model.dart';
import 'package:movie_app/domain/models/user_dataModel.dart';
import 'package:movie_app/ui/app_widget/custome_elevated_button.dart';
import 'package:movie_app/ui/presentaion/favorite_cubit/favorite_cubit.dart';
import 'package:movie_app/ui/presentaion/favorite_cubit/favorite_state.dart';
import 'package:movie_app/ui/presentaion/history_cubit/histor_cubit.dart';
import 'package:movie_app/ui/screens/home/movie_image.dart';

import '../../../../core/di/di.dart';
import '../../../presentaion/auth_cubit/cubit_auth.dart';
import '../../../presentaion/history_cubit/history_state.dart';
import '../../Authentication/login_screen.dart';

class ProfileTab extends StatefulWidget {

  ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {

   late List <MovieDetailsModel> movies=[];
   late List <MovieDetailsModel> moviesH=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("--------------HistoryCubit instance: $hashCode");
    if (UserDM.currentUser != null) {
      context.read<FavoriteCubit>()
          .loadFavoriteMovies(UserDM.currentUser!.id);

      context.read<HistoryCubit>()
          .loadHistoryMovies(UserDM.currentUser!.id);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.black,
      body: DefaultTabController(length: 2,

        child: Column(
          children: [
            Container(height: 300,width: double.infinity,
              decoration: BoxDecoration(color: Appcolors.darkGrey),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [SizedBox(height: 30,),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [

                        Expanded(
                          child: Column(children: [
                          ClipRRect(borderRadius: BorderRadius.circular(60),
                              child:_buildProfileImage())

                          ,
                    SizedBox(height: 20,),
                            Text(UserDM.currentUser?.name??"guest",
                              style: Appstyles.white20bold,)
                                                  ],),
                        ),

                      Expanded(
                        child: Column(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("${
                              UserDM.currentUser?.favoriteMovies.length ?? 0}"
                            ,style: Appstyles.white36Med),
                            SizedBox(height: 10,),
                            Text(Appstrings.wishList,style: Appstyles.white24Med)

                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text("${UserDM.currentUser?.historyMovies.length??0}",style: Appstyles.white36Med,),
                            SizedBox(height: 10,),
                            Text(Appstrings.history,style: Appstyles.white24Med,)

                          ],
                        ),
                      )
                    ],),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                    Expanded(flex:2,child:
                    CustomElevatedButton(
                      text: Appstrings.editProfile,onClick: (){
              Navigator.push(context,AppRoutes.updateProfile);

                    },)),
                    Expanded(flex:1 ,
                      child: CustomElevatedButton(textColor: Appcolors.white,
                        borderColor: Appcolors.red,

                        onClick: ()async {
                          await context.read<AuthCubit>().logout();
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (_) => LoginScreen()),
                                (route) => false,
                          );
                        },
                          backgroundColor: Appcolors.red,icon:
                      Icon(Icons.exit_to_app_sharp,color: Appcolors.white,),
                        text: Appstrings.exist,),
                    )
                  ],),]),)),
                   TabBar(
                      labelColor: Appcolors.white,
                      unselectedLabelColor: Appcolors.white,
                      unselectedLabelStyle: Appstyles.white16Reg,
                      labelStyle: Appstyles.white16Reg,
                      indicatorColor: Appcolors.yellow,
                      tabs:[
                      Tab(icon: Image.asset(Appassets.menue),
                          text:Appstrings.wishList),
                      Tab(icon:Image.asset(Appassets.folder),text: Appstrings.history,)
                    ],
                    ),

                    Expanded(
                      child: TabBarView(children: [
                        buildWishlistTab(),
                        buildHistorylistTab()



                                        ],),
                    ),

           ] ),
            ),




                );
  }

  Widget _buildProfileImage() {
    final user = UserDM.currentUser;

    if (user == null) {
      // ⏳ While loading or not set
      return Image.asset(
        Appassets.photo2,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      );
    }

    final image = user.image;

    if (image == null || image.isEmpty || image.startsWith("http")) {
      return Image.asset(
        Appassets.photo2,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      );
    }

    return Image.asset(
      image,
      width: 100,
      height: 100,
      fit: BoxFit.cover,
    );
  }

  buildWishlistTab(){

    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {

        if (state is FavoriteLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is FavoriteLoaded) {

          final movies = state.movies;

          if (UserDM.currentUser == null || movies.isEmpty) {

            return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Appassets.empty1),
                    SizedBox(height: 16),
                    Text("No favorite movies yet"),
                  ],
                )
            );
          }

          return  GridView.builder(

            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: .5,
              mainAxisExtent: 300,
              crossAxisCount: 2,

            ),
            itemCount: movies.length,
              itemBuilder: (context, index) {
                if (index >= movies.length) return SizedBox();

                return MovieImage(
                  movie: movies[index],
                );

              },

          );
        }

        if (state is FavoriteError) {
          return Center(child: Text(state.message));
        }

        return const SizedBox();
      },
    );
  }




   buildHistorylistTab() {
     return BlocBuilder<HistoryCubit, HistoryState>(
       builder: (context, state) {

         if (state is HistoryLoading) {
           return const Center(child: CircularProgressIndicator());
         }

         if (state is HistoryLoaded) {

           final moviesH = state.movies;

           if (UserDM.currentUser == null || moviesH.isEmpty) {
             return Center(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Image.asset(Appassets.empty1),
                   SizedBox(height: 16),
                   Text("No history movies yet"),
                 ],
               ),
             );
           }

           return GridView.builder(
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               childAspectRatio: .5,
               mainAxisExtent: 300,
               crossAxisCount: 2,
             ),
             itemCount: moviesH.length,
             itemBuilder: (context, index) {
               if (index >= moviesH.length) return SizedBox();

               return MovieImage(
                 movie: moviesH[index],
               );
             },
           );
         }

         if (state is HistoryError) {
           return Center(child: Text(state.message));
         }

         return const SizedBox();
       },
     );
   }

}
