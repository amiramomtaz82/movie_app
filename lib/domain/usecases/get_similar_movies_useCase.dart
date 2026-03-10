import 'package:injectable/injectable.dart';

import '../../core/utilis/api_result.dart';
import '../models/movieDetails_model.dart';

import '../reopsotries/movie_repo.dart';

@injectable
class GetSimilarMoviesUsecase {
  final MovieRepo _movieRepo;

  GetSimilarMoviesUsecase(this._movieRepo);

  Future<ApiResult<List<MovieDetailsModel>>> call(String movieId) => _movieRepo.getSimilarMovies(movieId);
}
