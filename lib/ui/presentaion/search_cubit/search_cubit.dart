import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/utilis/resource.dart';

import '../../../domain/usecases/searchMovie_useCase.dart';
import 'search_state.dart';
@injectable
class SearchCubit extends Cubit<SearchState> {

 final SearchMovieUsecase searchMovieUsecase;

  SearchCubit(this.searchMovieUsecase) : super(SearchState.initial());

  Future<void> searchMovies(String query) async {

    emit(state.copyWith(
      searchMovies: Resource.loading(),
    ));

    var result = await searchMovieUsecase(query);

    if (result.isSuccess) {

      emit(state.copyWith(
        searchMovies: Resource.success(result.getData() ?? []),
      ));

    } else {

      emit(state.copyWith(
        searchMovies: Resource.error(
          result.error.message ?? "Something went wrong",
        ),
      ));

    }
  }
}