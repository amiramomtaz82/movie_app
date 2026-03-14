import 'package:movie_app/domain/models/movieDetails_model.dart';

abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}



class FavoriteLoaded extends FavoriteState {
  final List<MovieDetailsModel> movies;
  final List<String> favoriteIds; // track favorite movie IDs
  FavoriteLoaded(this.movies, this.favoriteIds);
}
class FavoriteUpdated extends FavoriteState {}

class FavoriteError extends FavoriteState {
  final String message;

  FavoriteError(this.message);
}