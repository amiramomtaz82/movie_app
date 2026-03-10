import 'package:injectable/injectable.dart';
import 'package:movie_app/core/network/models/response/list_movie_response/MovieResponse.dart';
import 'package:movie_app/core/network/models/response/movieDetails/MovieDetails.dart';
import 'package:movie_app/core/network/models/response/sugestion/SugestionResponse.dart';
import 'package:movie_app/domain/models/movieDetails_model.dart';

import '../../../core/network/api_manager/api_client.dart';
import '../../../core/utilis/api_result.dart';
import '../../../core/utilis/app_error.dart';
import 'movie_dataSource.dart';


@Injectable(as: MovieRemoteDataSource)
class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  ApiClient _apiClient;

 MovieRemoteDataSourceImpl(this._apiClient);

  Future<ApiResult<MovieDetails>> getMovieDetails(String movieId,bool withImage,bool withCast) async {
    try {
      var response = await _apiClient.getMovieDetails( movieId,true,true);
      return SuccessApiResult(response);
    } catch (e) {
      return ErrorApiResult(ApiError());
    }
  }
  Future<ApiResult<SugestionResponse>> getSimilarMovies(String movie) async {
    try {
      var response = await _apiClient.getSimilarMovies(movie);
      return SuccessApiResult(response);
    } catch (e) {
      return ErrorApiResult(ApiError());
    }
  }
  Future<ApiResult<MovieResponse>> searchMovie(String query) async {
    try {
      var response = await _apiClient.searchMovie(query);
          return SuccessApiResult(response);
    } catch (e) {
      return ErrorApiResult(ApiError());
    }
  }




  Future<ApiResult<MovieResponse>> getMovies() async {
    try {
      var response = await _apiClient.getMovies();
      return SuccessApiResult(response);
    } catch (e) {
      return ErrorApiResult(ApiError());
    }
  }

  Future<ApiResult<MovieResponse>> getMoviesByGenre(
      String genre,
      ) async {
    try {
      var response = await _apiClient.getMoviesByGenre(genre);
      return SuccessApiResult(response);
    } catch (e) {
      return ErrorApiResult(ApiError());
    }
  }
}
