import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utilis/app_colors.dart';
import 'package:movie_app/core/utilis/app_constant.dart';
import 'package:movie_app/core/utilis/app_text_style.dart';
import 'package:movie_app/ui/screens/home/movie_image.dart';
import 'package:movie_app/ui/screens/movie_details/genger_card.dart';

import '../../../../core/di/di.dart';
import '../../../../core/utilis/resource.dart';
import '../../../presentaion/movie_cubit/genre_cubit.dart';
import '../../../presentaion/movie_cubit/genre_state.dart';
import '../../../presentaion/movie_cubit/movieDetails_cubit.dart';
import '../../../presentaion/movie_cubit/movie_cubit_state.dart';
import '../profile_tab/image_selected.dart';

class BrowesTab extends StatefulWidget {
  const BrowesTab({Key? key}) : super(key: key);

  @override
  State<BrowesTab> createState() => _BrowesTabState();
}

class _BrowesTabState extends State<BrowesTab> {
 late String genre ;
  int selectedTab=0;
  var movieCubit = getIt<MovieCubit>();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    genre=gengerTitleList[0];
    movieCubit.loadMoviesByGenre(genre);

  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (_) => movieCubit,
      child: DefaultTabController(length: gengerTitleList.length,
        child: SingleChildScrollView(
          child: Column(
            children: [SizedBox(height: 30,),
              TabBar(onTap: (val){

                selectedTab=val;
                genre = gengerTitleList[val] ?? "";

                movieCubit.loadMoviesByGenre(genre);

                setState(() {

                });
              },
              labelColor: Appcolors.black,
                labelStyle:Appstyles.black20med,
                unselectedLabelStyle: Appstyles.black20med.copyWith(color: Appcolors.yellow),

              unselectedLabelColor: Appcolors.yellow,
              isScrollable: true,
              tabAlignment: TabAlignment.start,



              tabs: gengerTitleList
                  .asMap()
                  .entries
                  .map((entry) {
                int index = entry.key;
                String? title = entry.value;

                bool isSelected = selectedTab == index;

             return Container(
               width:isSelected?104:132,height:48,decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
              border:Border.all(color:Appcolors.yellow),color: isSelected? Appcolors.yellow:Appcolors.black ),
                child: Tab(
                  child: Text(title ?? ""),
                ),
              );})
              .toList(),
            ),
              BlocBuilder<MovieCubit, MovieState>(
                builder: (context, state) {


                  if (state.moviesApi.status == ApiStatus.success &&
                      state.moviesApi.data != null) {

                    return GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio:.5,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 5,
                      ),
                      itemCount: state.moviesApi.data!.length,
                      itemBuilder: (context, index) {
                        return MovieImage(
                          movie: state.moviesApi.data![index],

                        );
                      },
                    );
                  }

                  else if (state.moviesApi.status == ApiStatus.error) {
                    return Text(state.moviesApi.errorMessage ?? "");
                  }

                  else {
                    print("-----------------------------");
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }}