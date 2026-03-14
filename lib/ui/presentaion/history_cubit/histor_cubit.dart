import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/models/movieDetails_model.dart';
import '../../../domain/models/user_dataModel.dart';
import '../../../domain/usecases/add_movie_to_history_usecase.dart';
import '../../../domain/usecases/load_movies_form_history_usecase.dart';
import 'history_state.dart';

@singleton
class HistoryCubit extends Cubit<HistoryState> {

  final AddMovieToHistoryUsecase addHistoryMovie;
  final GetHistoryMoviesUsecase getHistoryMovies;

  HistoryCubit(this.addHistoryMovie, this.getHistoryMovies)
      : super(HistoryInitial());

  Future<void> loadHistoryMovies(String userId) async {

    emit(HistoryLoading());

    try {

      final movies = await getHistoryMovies(userId);

      emit(HistoryLoaded(movies));

    } catch (e) {

      emit(HistoryError(e.toString()));

    }
  }

  Future<void> addMovieToHistory(MovieDetailsModel movie) async {
    List<MovieDetailsModel> currentMovies =
    state is HistoryLoaded ? List.from((state as HistoryLoaded).movies) : [];

    if (!currentMovies.any((m) => m.id == movie.id)) {
      print("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXaddToHistory called with id: ${movie.id}");

      await addHistoryMovie(movie.id.toString());

      currentMovies.add(movie);

      UserDM.currentUser?.historyMovies.add(movie.id.toString());

      emit(HistoryLoaded(currentMovies));
    }
  }
}