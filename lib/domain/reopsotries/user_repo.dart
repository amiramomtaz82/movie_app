import 'package:movie_app/domain/models/movieDetails_model.dart';

import '../../core/utilis/api_result.dart';

abstract class UserRepository {

  Future<void> addFavoriteMovie(String movieId);

  Future<void> removeFavoriteMovie(String movieId);

  Future<void> addHistoryMovie(String movieId);

  Future<List<MovieDetailsModel>> getFavoriteMovies(
      String userId, {
        bool withImage = true,
        bool withCast = true,
      });


  Future<List<MovieDetailsModel>> getHistoryMovies(String userId);
}