import '../../../core/utilis/resource.dart';
import '../../../domain/models/movieDetails_model.dart';

class MovieDetailsState {
  Resource<MovieDetailsModel> movieDetails;
  Resource<List<MovieDetailsModel>> similarMovies;

  MovieDetailsState({
    required this.movieDetails,
    required this.similarMovies,
  });

  factory MovieDetailsState.initial() {
    return MovieDetailsState(
      movieDetails: Resource.initial(),
      similarMovies: Resource.initial(),
    );
  }

  MovieDetailsState copyWith({
    Resource<MovieDetailsModel>? movieDetails,
    Resource<List<MovieDetailsModel>>? similarMovies,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      similarMovies: similarMovies ?? this.similarMovies,
    );
  }
}