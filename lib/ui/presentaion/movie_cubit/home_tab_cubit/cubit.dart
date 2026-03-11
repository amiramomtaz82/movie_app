//
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/utilis/api_result.dart';
import 'package:movie_app/core/utilis/resource.dart';
import 'package:movie_app/domain/models/movieDetails_model.dart';
import 'package:movie_app/domain/usecases/get_movies_by_genger_usecase.dart';
import 'package:movie_app/domain/usecases/get_movies_usecae.dart';
import 'package:movie_app/ui/presentaion/movie_cubit/home_tab_cubit/state.dart';




@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetMoviesUseCase _moviesUseCase;
  final GetMoviesUseCaseByGenre _getMoviesByGenreUseCase;

  HomeCubit(this._moviesUseCase, this._getMoviesByGenreUseCase)
      : super(HomeState.initial());

  Future<void> loadMovies() async {

    final map =
    Map<String, Resource<List<MovieDetailsModel>>>.from(state.moviesByGenre);

    map["popularInterests"] = Resource.loading();
    emit(state.copyWith(moviesByGenre: map));

    final result = await _moviesUseCase();

    if (result.isSuccess) {
      map["popularInterests"] = Resource.success(result.getData() ?? []);
    } else {
      map["popularInterests"] = Resource.error(result.error.message);
    }

    emit(state.copyWith(moviesByGenre: map));
  }
  Future<void> loadMoviesByGenre(String genre) async {

    final map =
    Map<String, Resource<List<MovieDetailsModel>>>.from(state.moviesByGenre);

    map[genre] = Resource.loading();
    emit(state.copyWith(moviesByGenre: map));

    final result = await _getMoviesByGenreUseCase(genre);

    if (result.isSuccess) {
      map[genre] = Resource.success(result.getData() ?? []);
    } else {
      map[genre] = Resource.error(result.error.message);
    }

    emit(state.copyWith(moviesByGenre: map));
  }
}

