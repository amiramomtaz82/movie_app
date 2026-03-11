import '../../../../core/utilis/resource.dart';
import '../../../../domain/models/movieDetails_model.dart';

class HomeState {
  final Map<String, Resource<List<MovieDetailsModel>>> moviesByGenre;

  HomeState(this.moviesByGenre);

  factory HomeState.initial() {
    return HomeState({});
  }

  HomeState copyWith({
    Map<String, Resource<List<MovieDetailsModel>>>? moviesByGenre,
  }) {
    return HomeState(
      moviesByGenre ?? this.moviesByGenre,
    );
  }
}