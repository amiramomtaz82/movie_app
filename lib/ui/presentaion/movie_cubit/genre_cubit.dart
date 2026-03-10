//
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/utilis/api_result.dart';
import 'package:movie_app/core/utilis/resource.dart';
import 'package:movie_app/domain/models/movieDetails_model.dart';
import 'package:movie_app/domain/usecases/get_movies_by_genger_usecase.dart';
import 'package:movie_app/domain/usecases/get_movies_usecae.dart';


import 'genre_state.dart';
import 'movie_cubit_state.dart';

@injectable
class MovieCubit extends Cubit<MovieState> {
  final GetMoviesUseCase _moviesUseCase;
  final GetMoviesUseCaseByGenre _getMoviesByGenreUseCase;

  MovieCubit( this._moviesUseCase,this._getMoviesByGenreUseCase)
      : super(MovieState.initial());

  loadMoviesb() async {


    emit(MovieState(Resource.loading()));
    var apiResult = await _moviesUseCase();
    if (apiResult.isSuccess) {
      emit(MovieState(Resource.success(apiResult.getData() )));
    }else {
      emit(
        MovieState(
          Resource.error(apiResult.error.message),
        ),
      );
    }

  }
  Future<void> loadMoviesByGenre(String genre) async {

    emit(state.copyWith(moviesApi: Resource.loading()));

    final result = await _getMoviesByGenreUseCase(genre);

    if (result.isSuccess) {
      final movies = result.getData();
      print("Movies count: ${movies?.length}");
      emit(state.copyWith(
        moviesApi: Resource.success(result.getData()??[]),

      ));

    } else {
      emit(state.copyWith(
        moviesApi: Resource.error(result.error.message),
      ));
    }
  }
}

