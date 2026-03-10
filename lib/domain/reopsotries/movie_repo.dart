import 'package:flutter/foundation.dart';

import '../../core/utilis/api_result.dart';
import '../models/movieDetails_model.dart';


abstract class MovieRepo {
  Future<ApiResult<List<MovieDetailsModel>>> getMovies();
  Future<ApiResult<MovieDetailsModel>> getMovieDetails(String movieId,bool withImage,bool withCast);
  Future<ApiResult<List<MovieDetailsModel>>> getMoviesByGenre(String genre);
  Future<ApiResult<List<MovieDetailsModel>>> searchMovie(String query);
  Future<ApiResult<List<MovieDetailsModel>>> getSimilarMovies(String movieId);
}