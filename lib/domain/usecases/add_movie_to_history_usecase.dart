import 'package:injectable/injectable.dart';

import '../reopsotries/user_repo.dart';

@injectable

class AddMovieToHistoryUsecase {

  final UserRepository repository;

  AddMovieToHistoryUsecase(this.repository);

  Future<void> call(String movieId) {
    return repository.addHistoryMovie(movieId);
  }
}