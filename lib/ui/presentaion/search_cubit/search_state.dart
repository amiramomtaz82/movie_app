import 'package:movie_app/domain/models/movieDetails_model.dart';

import '../../../core/utilis/resource.dart';


class SearchState {

  Resource<List<MovieDetailsModel>> searchMovies;

  SearchState({required this.searchMovies});

  factory SearchState.initial(){
    return SearchState(
      searchMovies: Resource.initial(),
    );
  }

  SearchState copyWith({
    Resource<List<MovieDetailsModel>>? searchMovies,
  }) {
    return SearchState(
      searchMovies: searchMovies ?? this.searchMovies,
    );
  }
}