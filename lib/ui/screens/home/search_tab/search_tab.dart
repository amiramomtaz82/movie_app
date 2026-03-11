import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utilis/app_assets.dart';
import 'package:movie_app/core/utilis/app_colors.dart';
import 'package:movie_app/core/utilis/app_constant.dart';
import 'package:movie_app/core/utilis/app_text_style.dart';
import 'package:movie_app/ui/app_widget/custom_text_field.dart';
import 'package:movie_app/ui/presentaion/search_cubit/search_cubit.dart';
import 'package:movie_app/ui/screens/home/movie_image.dart';

import '../../../../core/di/di.dart';
import '../../../presentaion/search_cubit/search_state.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({Key? key}) : super(key: key);

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
SearchCubit searchCubit=getIt<SearchCubit>();
  TextEditingController queryController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return
     BlocProvider(create: (_) => searchCubit,
        child: SafeArea(
          child: Scaffold(backgroundColor: Appcolors.black,
          body: Expanded(
            child: Column(children: [
              CustomTextField(
               
               controller: queryController,
                hint: Appstrings.search,prefixIcon:
              IconButton(onPressed: (){
                searchCubit.searchMovies(queryController.text);
              },
                  icon: Image.asset(Appassets.vector1)),
              ),
              Expanded(
                child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state.searchMovies.isLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state.searchMovies.isError) {
                      return Center(child: Text(state.searchMovies.errorMessage ?? ""));
                    } else if (state.searchMovies.isSuccess) {
                      final movies = state.searchMovies.data ?? [];
                      if (movies.isEmpty) {
                        return Center(child: Text("No movies found"));
                      }
                      return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: .4,
                          mainAxisExtent:300,
                          crossAxisCount: 2
                      ),
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          return MovieImage(movie: movies[index]);
                        },
                      );
                    } else {
                      return Center(
                        child: Image.asset(Appassets.empty1, height: 124, width: 124),
                      );
                    }
                  },
                ),
              )
            
            ]
            
            ),
          )
            ),
        ),

    );
  }
}
