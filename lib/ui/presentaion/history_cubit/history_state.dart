import '../../../domain/models/movieDetails_model.dart';

abstract class HistoryState {}

class HistoryInitial extends HistoryState {}

class HistoryLoading extends HistoryState {}

class HistoryLoaded extends HistoryState {
  final List<MovieDetailsModel> movies;

  HistoryLoaded(this.movies);
}

class HistoryError extends HistoryState {
  final String message;

  HistoryError(this.message);
}