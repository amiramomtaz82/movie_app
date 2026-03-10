import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/utilis/app_error.dart';

import '../../../core/utilis/resource.dart';
import '../../../domain/usecases/get_movie_details_useCase.dart';
import '../../../domain/usecases/get_similar_movies_useCase.dart';
import 'movie_cubit_state.dart';
@injectable
class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final GetMovieDetailsUsecase _getMovieDetailsUsecase;
  final GetSimilarMoviesUsecase _getSimilarMoviesUsecase;

  MovieDetailsCubit(this._getMovieDetailsUsecase,
      this._getSimilarMoviesUsecase,) : super(MovieDetailsState.initial());


  Future<void> loadMovieDetails(String movieId) async {
    emit(state.copyWith(movieDetails: Resource.loading()));

    final result = await _getMovieDetailsUsecase(movieId, true, true);

    if (result.isSuccess) {
      emit(state.copyWith(
        movieDetails: Resource.success(result.getData()),
      ));
    } else {
      emit(state.copyWith(
        movieDetails: Resource.error(result.error.message),
      ));
    }


  }

  Future<void> loadSimilarMovies(String movieId) async {
    emit(state.copyWith(similarMovies: Resource.loading()));

    final result = await _getSimilarMoviesUsecase(movieId);

    if (result.isSuccess) {
      emit(state.copyWith(
        similarMovies: Resource.success(result.getData()),
      ));
    } else {
      emit(state.copyWith(
        similarMovies: Resource.error(result.error.message),
      ));
    }
  }
}