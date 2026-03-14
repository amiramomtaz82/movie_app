import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/mappers/movie_mapper.dart';
import 'package:movie_app/data/mappers/new_mapper.dart';
import 'package:movie_app/domain/models/movieDetails_model.dart';
import 'package:movie_app/domain/reopsotries/user_repo.dart';

import '../../../domain/models/user_dataModel.dart';
import '../../../domain/usecases/add_movie_to_favorite_usecase.dart';
import '../../../domain/usecases/get_movies_usecae.dart';
import '../../../domain/usecases/load_favorite_movies_usecase.dart';
import '../../../domain/usecases/remove_movie_from_favorite_usecase.dart';
import 'favorite_state.dart';
@singleton
class FavoriteCubit extends Cubit<FavoriteState> {

  final AddFavoriteMovieUsecase addFavoriteMovie;
  final RemoveFavoriteMovieUsecase removeFavoriteMovie;
  final GetFavoriteMoviesUsecase getFavoriteMoviesUsecase;

  final NewMapper newMapper;


  FavoriteCubit(this.addFavoriteMovie, this.removeFavoriteMovie,
      this.getFavoriteMoviesUsecase, this.newMapper,
    )
      : super(FavoriteInitial());

  Future<void> loadFavoriteMovies(String userId) async {
    emit(FavoriteLoading());
    try {
      var movies = await getFavoriteMoviesUsecase(userId);

      // get IDs from movies
      List<String> ids = movies.map((m) => m.id!).toList();

      emit(FavoriteLoaded(movies, ids));
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }


  Future<void> toggleFavorite(MovieDetailsModel movie) async {
    if (state is FavoriteLoaded) {
      final currentState = state as FavoriteLoaded;
      final updatedMovies = List<MovieDetailsModel>.from(currentState.movies);
      final updatedIds = List<String>.from(currentState.favoriteIds);

      if (updatedIds.contains(movie.id.toString())) {
        // optimistic removal
        updatedIds.remove(movie.id.toString());
        updatedMovies.removeWhere((m) => m.id == movie.id);
        emit(FavoriteLoaded(updatedMovies, updatedIds));

        try {
          await removeFavoriteMovie(movie.id!);
        } catch (e) {
          // revert if failed
          updatedIds.add(movie.id.toString());
          updatedMovies.add(movie);
          emit(FavoriteLoaded(updatedMovies, updatedIds));
        }
      } else {
        // optimistic add
        updatedIds.add(movie.id.toString());
        updatedMovies.add(movie);
        emit(FavoriteLoaded(updatedMovies, updatedIds));

        try {
          await addFavoriteMovie(movie.id!);
        } catch (e) {
          // revert if failed
          updatedIds.remove(movie.id.toString());
          updatedMovies.removeWhere((m) => m.id == movie.id);
          emit(FavoriteLoaded(updatedMovies, updatedIds));
        }
      }
    }
  }

  // Future<void> toggleFavorite(MovieDetailsModel movie) async {
  //   if (state is FavoriteLoaded) {
  //     var currentState = state as FavoriteLoaded;
  //     List<MovieDetailsModel> updatedMovies = List.from(currentState.movies);
  //     List<String> updatedIds = List.from(currentState.favoriteIds);
  //
  //     if (updatedIds.contains(movie.id)) {
  //       // remove
  //       await removeFavoriteMovie(movie.id!);
  //       updatedIds.remove(movie.id);
  //       updatedMovies.removeWhere((m) => m.id == movie.id);
  //     } else {
  //       // add
  //       await addFavoriteMovie(movie.id!);
  //       updatedIds.add(movie.id!);
  //       updatedMovies.add(movie);
  //     }
  //
  //     // emit updated state
  //     emit(FavoriteLoaded(updatedMovies, updatedIds));
  //   }
  // }
  //
  //
  //
  // Future<void> toggleFavorite(String movieId) async {
  //   emit(FavoriteLoading());
  //
  //   try {
  //     if (UserDM.currentUser!.favoriteMovies.contains(movieId)) {
  //       await removeFavoriteMovie(movieId);
  //       UserDM.currentUser!.favoriteMovies.remove(movieId);
  //     } else {
  //       await addFavoriteMovie(movieId);
  //       UserDM.currentUser!.favoriteMovies.add(movieId);
  //     }
  //
  //     await loadFavoriteMovies(UserDM.currentUser!.id);
  //
  //   } catch (e) {
  //     emit(FavoriteError(e.toString()));
  //   }
  // }






// Future<void> loadFavoriteMovies(String userId) async {
  //
  //   emit(FavoriteLoading());
  //
  //   try {
  //
  //     var movies = await getFavoriteMoviesUsecase(userId);
  //
  //     emit(FavoriteLoaded(movies));
  //
  //   } catch (e) {
  //
  //     emit(FavoriteError(e.toString()));
  //
  //   }
  // }
}