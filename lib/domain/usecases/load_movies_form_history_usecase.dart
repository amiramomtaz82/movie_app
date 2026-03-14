import 'package:injectable/injectable.dart';

import '../models/movieDetails_model.dart';
import '../reopsotries/user_repo.dart';

@injectable
class GetHistoryMoviesUsecase {

  final UserRepository repo;

  GetHistoryMoviesUsecase(this.repo);

  Future<List<MovieDetailsModel>> call(String userId) {
    return repo.getHistoryMovies(userId);
  }
}