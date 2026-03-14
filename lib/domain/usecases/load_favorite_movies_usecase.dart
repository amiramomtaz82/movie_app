import 'package:injectable/injectable.dart';

import '../models/movieDetails_model.dart';
import '../reopsotries/user_repo.dart';

@injectable
class GetFavoriteMoviesUsecase {

  final UserRepository repository;

  GetFavoriteMoviesUsecase(this.repository);

  Future<List<MovieDetailsModel>> call(String userId) {

    return repository.getFavoriteMovies(userId);

  }
}