import 'package:injectable/injectable.dart';

import '../reopsotries/user_repo.dart';
@injectable
class AddFavoriteMovieUsecase {

  final UserRepository repository;

  AddFavoriteMovieUsecase(this.repository);

  Future<void> call(String movieId) {
    return repository.addFavoriteMovie(movieId);
  }
}