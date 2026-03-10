import 'package:injectable/injectable.dart';

import '../../core/utilis/api_result.dart';
import '../models/movieDetails_model.dart';

import '../reopsotries/movie_repo.dart';

@injectable
class GetMoviesUseCaseByGenre {
  final MovieRepo _movieRepo;

  GetMoviesUseCaseByGenre(this._movieRepo);

  Future<ApiResult<List<MovieDetailsModel>>> call(String genre) => _movieRepo.getMoviesByGenre(genre);
}