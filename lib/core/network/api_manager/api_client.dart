import 'package:dio/dio.dart';
import 'package:movie_app/core/network/models/response/movieDetails/MovieDetails.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/network/models/response/list_movie_response/MovieResponse.dart';

import '../models/response/sugestion/SugestionResponse.dart';

part 'api_client.g.dart';

@singleton
@RestApi(baseUrl: "https://movies-api.accel.li/api/v2/")
abstract class ApiClient {

  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @GET("list_movies.json")
  Future<MovieResponse> getMovies();

  @GET("list_movies.json")
  Future<MovieResponse> getMoviesByGenre(
      @Query("genre") String genre,
      );


  @GET("movie_details.json")
  Future<MovieDetails> getMovieDetails(
  @Query("movie_id") String movieId,
  @Query("with_images") bool withImages ,
  @Query("with_cast") bool withCast ,
  );

  @GET("movie_suggestions.json")
  Future<SugestionResponse> getSimilarMovies(
      @Query("movie_id") String movieId,
      );


  @GET("list_movies.json")
  Future<MovieResponse> searchMovie(
      @Query("query_term") String query, {
        @Query("page") int page = 1,
        @Query("limit") int limit = 20,
      });

}
