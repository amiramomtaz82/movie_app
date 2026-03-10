import 'package:movie_app/core/network/models/response/list_movie_response/MovieResponse.dart';
import 'package:movie_app/core/network/models/response/movieDetails/MovieDetails.dart';
import 'package:movie_app/core/network/models/response/sugestion/SugestionResponse.dart';

import '../../../core/utilis/api_result.dart';

abstract class MovieRemoteDataSource {
  Future<ApiResult<MovieResponse>> getMovies();
  Future<ApiResult<MovieResponse>> getMoviesByGenre(String genre);
  Future<ApiResult<MovieDetails>> getMovieDetails(String movieId,bool withImage,bool withCast);
  Future<ApiResult<MovieResponse>> searchMovie(String query);
  Future<ApiResult<SugestionResponse>> getSimilarMovies(String movieId);



}

