import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/ui/presentaion/movie_cubit/home_tab_cubit/cubit.dart';
import 'package:movie_app/ui/screens/home/home_tab/movie_list_genre.dart';
import 'package:movie_app/ui/screens/home/movie_image.dart';

import '../../../../core/di/di.dart';
import '../../../presentaion/movie_cubit/genre_cubit.dart';
import '../../../presentaion/movie_cubit/home_tab_cubit/state.dart';
import 'image_view.dart';

class GenreWidget extends StatefulWidget {
  final String genre;

  const GenreWidget({Key? key, required this.genre}) : super(key: key);


  @override
  _GenreWidgetState createState() => _GenreWidgetState();
}

class _GenreWidgetState extends State<GenreWidget> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {

        final genreMovies = state.moviesByGenre[widget.genre];

        if (genreMovies == null || genreMovies.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final movies = genreMovies.data ?? [];

        return Column(
          children: state.moviesByGenre.entries.map((entry) {
            final genre = entry.key;
            final resource = entry.value;

            if (resource.isLoading) return CircularProgressIndicator();

            if (resource.isError) return Text("Error: ${resource.errorMessage}");

            final movies = resource.data ?? [];

            return MovieListGenre(
              title: genre,
              movies: movies,
            );
          }).toList(),
        );
      },
    );
  }

}