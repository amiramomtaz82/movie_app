import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_app/data/movie/remote_data_source/movie_dataSource.dart';
import 'package:movie_app/domain/models/movieDetails_model.dart';

import '../../core/utilis/api_result.dart';
import '../../core/utilis/app_error.dart';
import '../../core/utilis/extensions/connectivity.dart';

import '../../domain/reopsotries/movie_repo.dart';
import '../mappers/movie_mapper.dart';

@Injectable(as: MovieRepo)
class MovieRepoImp extends MovieRepo {
  final MovieRemoteDataSource _movieRemoteDataSource;
  final Connectivity _connectivity;

  final MovieMapper _moviesMapper;


MovieRepoImp(this._movieRemoteDataSource,
      this._connectivity,
      this._moviesMapper,);

  Future<ApiResult<List<MovieDetailsModel>>> getMovies() async {
    if (await _connectivity.isConnected()) {
      var apiResult = await _movieRemoteDataSource.getMovies();
      if (apiResult.isSuccess) {
        var moviesResponse = apiResult.getData();
        return SuccessApiResult(
          _moviesMapper.toMovies(moviesResponse?.data?.movies??[]),
        );
      } else {
        return ErrorApiResult(apiResult.error);
      }
    } else {
      return ErrorApiResult(NetworkError());
    }
  }


  Future<ApiResult<List<MovieDetailsModel>>> getMoviesByGenre(String genre) async {
    if (await _connectivity.isConnected()) {
      var apiResult =
      await _movieRemoteDataSource.getMoviesByGenre(genre);
      if (apiResult.isSuccess) {
        var moviesResponse = apiResult.getData();
        return SuccessApiResult(
          _moviesMapper.toMovies(moviesResponse?.data?.movies??[]),
        );
      } else {
        return ErrorApiResult(apiResult.error);
      }
    } else {
      return ErrorApiResult(NetworkError());
    }
  }
  //=================================================


  Future<ApiResult<List<MovieDetailsModel>>> getSimilarMovies(String movieId) async {
    if (await _connectivity.isConnected()) {
      var apiResult =
      await _movieRemoteDataSource.getSimilarMovies(movieId);
      if (apiResult.isSuccess) {
        var moviesResponse = apiResult.getData();
        return SuccessApiResult(
          _moviesMapper.toMovies(moviesResponse?.data?.movies??[]),
        );
      } else {
        return ErrorApiResult(apiResult.error);
      }
    } else {
      return ErrorApiResult(NetworkError());
    }
  }

  //================================================
  Future<ApiResult<List<MovieDetailsModel>>> searchMovie(String query) async {
    if (await _connectivity.isConnected()) {
      var apiResult =
      await _movieRemoteDataSource.searchMovie(query);
      if (apiResult.isSuccess) {
        var moviesResponse = apiResult.getData();
        return SuccessApiResult(
          _moviesMapper.toMovies(moviesResponse?.data?.movies??[]),
        );
      } else {
        return ErrorApiResult(apiResult.error);
      }
    } else {
      return ErrorApiResult(NetworkError());
    }
  }
  ////=======================================================

  Future<ApiResult<MovieDetailsModel>> getMovieDetails (String movieId,bool withImage,bool withCast) async {
    if (await _connectivity.isConnected()) {
      var apiResult =
      await _movieRemoteDataSource.getMovieDetails(movieId,withImage,withCast);
      if (apiResult.isSuccess) {
        var moviesResponse = apiResult.getData();
        if (moviesResponse?.data?.movie == null) {
          return ErrorApiResult(ApiError());
        }
        return SuccessApiResult(
          _moviesMapper.toMovieDetails(moviesResponse!.data!.movie!),
        );
      } else {
        return ErrorApiResult(apiResult.error);
      }
    } else {
      return ErrorApiResult(NetworkError());
    }
  }
}