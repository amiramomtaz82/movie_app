import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../core/utilis/api_result.dart';
import '../models/movieDetails_model.dart';

import '../reopsotries/movie_repo.dart';
@injectable
   class GetMoviesUseCase {
  final MovieRepo _movieRepo;

  GetMoviesUseCase(this._movieRepo);

  Future<ApiResult<List<MovieDetailsModel>>> call() => _movieRepo.getMovies();
}
