

import 'package:injectable/injectable.dart';

import '../../core/network/models/response/movieDetails/MovieDetails.dart';
import '../../core/utilis/api_result.dart';
import '../models/movieDetails_model.dart';

import '../reopsotries/movie_repo.dart';

@injectable
class GetMovieDetailsUsecase {
  final MovieRepo _movieRepo;

  GetMovieDetailsUsecase(this._movieRepo);

  Future<ApiResult<MovieDetailsModel>> call(String movieId,bool withCast,bool withImage) => _movieRepo.getMovieDetails(movieId,withCast,withImage);
}