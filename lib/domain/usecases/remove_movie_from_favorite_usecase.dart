import 'package:injectable/injectable.dart';

import '../reopsotries/user_repo.dart';
@injectable

class RemoveFavoriteMovieUsecase {

  final UserRepository repository;

  RemoveFavoriteMovieUsecase(this.repository);

  Future<void> call(String movieId) {
    return repository.removeFavoriteMovie(movieId);
  }
}