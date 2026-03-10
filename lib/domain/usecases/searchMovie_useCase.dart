

import 'package:injectable/injectable.dart';

import '../../core/utilis/api_result.dart';
import '../models/movieDetails_model.dart';

import '../reopsotries/movie_repo.dart';

@injectable
class SearchMovieUsecase {
  final MovieRepo _movieRepo;

  SearchMovieUsecase(this._movieRepo);

  Future<ApiResult<List<MovieDetailsModel>>> call(String query) => _movieRepo.searchMovie(query);
}