import '../../../core/utilis/resource.dart';
import '../../../domain/models/movieDetails_model.dart';


class MovieState {
  final Resource<List<MovieDetailsModel>> moviesApi;

  MovieState(this.moviesApi);

  factory MovieState.initial() {
    return MovieState(Resource.initial());
  }

  MovieState copyWith({
    Resource<List<MovieDetailsModel>>? moviesApi,
  }) {
    return MovieState(
      moviesApi ?? this.moviesApi,
    );
  }
}