import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/mappers/movie_mapper.dart';
import 'package:movie_app/data/movie/remote_data_source/movie_dataSource.dart';
import 'package:movie_app/domain/models/movieDetails_model.dart';

import '../../core/utilis/api_result.dart';
import '../../core/utilis/app_error.dart';
import '../../domain/reopsotries/user_repo.dart';
import '../mappers/new_mapper.dart';
import 'data_source/user_data_source.dart';

@Injectable(as: UserRepository)

class UserRepositoryImpl implements UserRepository {

  final UserRemoteDataSource remoteDataSource;
  final MovieRemoteDataSource movieRemoteDataSource;
  final Connectivity connectivity;
  final NewMapper movieMapper;


  UserRepositoryImpl(this.remoteDataSource, this.movieRemoteDataSource,
      this.movieMapper, this.connectivity);

  @override
  Future<void> addFavoriteMovie(String movieId) {
    return remoteDataSource.addFavorite(movieId);
  }

  @override
  Future<void> removeFavoriteMovie(String movieId) {
    return remoteDataSource.removeFavorite(movieId);
  }

  @override
  Future<void> addHistoryMovie(String movieId) {
    return remoteDataSource.addHistory(movieId);
  }


  @override
  Future<List<MovieDetailsModel>> getFavoriteMovies(String userId,
      {bool withImage = true, bool withCast = true}) async {
    List<String> ids =
    await remoteDataSource.getFavoriteMovieIds(userId);

    List<MovieDetailsModel> movies = [];

    for (var id in ids) {
      var result =
      await movieRemoteDataSource.getMovieDetails(id, withImage, withCast);

      if (result.isSuccess) {
        var movie = movieMapper.toMovieDetails(result.getData()!);

        movies.add(movie);
      }
    }

    return movies;
  }


  @override
  Future<List<MovieDetailsModel>> getHistoryMovies(
      String userId, {
        bool withImage = true,
        bool withCast = true,
      }) async {

    // 1️⃣ get history movie ids from firebase
    List<String> ids =
    await remoteDataSource.getHistoryMovieIds(userId);

    List<MovieDetailsModel> movies = [];

    // 2️⃣ fetch movie details from API
    for (var id in ids) {

      var result =
      await movieRemoteDataSource.getMovieDetails(id, withImage, withCast);

      if (result.isSuccess) {

        final movie =
        movieMapper.toMovieDetails(result.getData()!);

        movies.add(movie);
      }
    }

    // 3️⃣ return movies list
    return movies;
  }

}
