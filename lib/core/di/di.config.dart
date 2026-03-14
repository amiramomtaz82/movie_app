// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/mappers/movie_mapper.dart' as _i9;
import '../../data/mappers/new_mapper.dart' as _i1002;
import '../../data/movie/movie_repo_imp.dart' as _i184;
import '../../data/movie/remote_data_source/movie_dataSource.dart' as _i769;
import '../../data/movie/remote_data_source/movie_dataSource_imp.dart' as _i160;
import '../../data/user_remote_dataSource/data_source/user_data_source.dart'
    as _i902;
import '../../data/user_remote_dataSource/data_source/user_data_source_imp.dart'
    as _i102;
import '../../data/user_remote_dataSource/user_repo_imp.dart' as _i577;
import '../../domain/reopsotries/movie_repo.dart' as _i224;
import '../../domain/reopsotries/user_repo.dart' as _i763;
import '../../domain/usecases/add_movie_to_favorite_usecase.dart' as _i444;
import '../../domain/usecases/add_movie_to_history_usecase.dart' as _i731;
import '../../domain/usecases/get_movie_details_useCase.dart' as _i397;
import '../../domain/usecases/get_movies_by_genger_usecase.dart' as _i367;
import '../../domain/usecases/get_movies_usecae.dart' as _i502;
import '../../domain/usecases/get_similar_movies_useCase.dart' as _i875;
import '../../domain/usecases/load_favorite_movies_usecase.dart' as _i313;
import '../../domain/usecases/load_movies_form_history_usecase.dart' as _i565;
import '../../domain/usecases/remove_movie_from_favorite_usecase.dart' as _i708;
import '../../domain/usecases/searchMovie_useCase.dart' as _i169;
import '../../ui/presentaion/favorite_cubit/favorite_cubit.dart' as _i71;
import '../../ui/presentaion/history_cubit/histor_cubit.dart' as _i887;
import '../../ui/presentaion/lacal_cubit/local_cubit.dart' as _i544;
import '../../ui/presentaion/movie_cubit/genre_cubit.dart' as _i630;
import '../../ui/presentaion/movie_cubit/home_tab_cubit/cubit.dart' as _i547;
import '../../ui/presentaion/movie_cubit/movieDetails_cubit.dart' as _i204;
import '../../ui/presentaion/search_cubit/search_cubit.dart' as _i909;
import '../network/api_manager/api_client.dart' as _i937;
import 'get_it_module.dart' as _i1015;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final getItModule = _$GetItModule();
    gh.factory<_i9.MovieMapper>(() => _i9.MovieMapper());
    gh.factory<_i1002.NewMapper>(() => _i1002.NewMapper());
    gh.singleton<_i895.Connectivity>(() => getItModule.createConnectivity());
    gh.singleton<_i361.Dio>(() => getItModule.createDio());
    gh.singleton<_i544.LocaleCubit>(() => _i544.LocaleCubit());
    gh.lazySingleton<_i974.FirebaseFirestore>(() => getItModule.firestore);
    gh.singleton<_i937.ApiClient>(() => _i937.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i902.UserRemoteDataSource>(
      () => _i102.UserRemoteDataSourceImp(gh<_i974.FirebaseFirestore>()),
    );
    gh.factory<_i769.MovieRemoteDataSource>(
      () => _i160.MovieRemoteDataSourceImpl(gh<_i937.ApiClient>()),
    );
    gh.lazySingleton<_i224.MovieRepo>(
      () => _i184.MovieRepoImp(
        gh<_i769.MovieRemoteDataSource>(),
        gh<_i895.Connectivity>(),
        gh<_i9.MovieMapper>(),
      ),
    );
    gh.factory<_i763.UserRepository>(
      () => _i577.UserRepositoryImpl(
        gh<_i902.UserRemoteDataSource>(),
        gh<_i769.MovieRemoteDataSource>(),
        gh<_i1002.NewMapper>(),
        gh<_i895.Connectivity>(),
      ),
    );
    gh.factory<_i444.AddFavoriteMovieUsecase>(
      () => _i444.AddFavoriteMovieUsecase(gh<_i763.UserRepository>()),
    );
    gh.factory<_i731.AddMovieToHistoryUsecase>(
      () => _i731.AddMovieToHistoryUsecase(gh<_i763.UserRepository>()),
    );
    gh.factory<_i313.GetFavoriteMoviesUsecase>(
      () => _i313.GetFavoriteMoviesUsecase(gh<_i763.UserRepository>()),
    );
    gh.factory<_i708.RemoveFavoriteMovieUsecase>(
      () => _i708.RemoveFavoriteMovieUsecase(gh<_i763.UserRepository>()),
    );
    gh.factory<_i397.GetMovieDetailsUsecase>(
      () => _i397.GetMovieDetailsUsecase(gh<_i224.MovieRepo>()),
    );
    gh.factory<_i367.GetMoviesUseCaseByGenre>(
      () => _i367.GetMoviesUseCaseByGenre(gh<_i224.MovieRepo>()),
    );
    gh.factory<_i502.GetMoviesUseCase>(
      () => _i502.GetMoviesUseCase(gh<_i224.MovieRepo>()),
    );
    gh.factory<_i875.GetSimilarMoviesUsecase>(
      () => _i875.GetSimilarMoviesUsecase(gh<_i224.MovieRepo>()),
    );
    gh.factory<_i169.SearchMovieUsecase>(
      () => _i169.SearchMovieUsecase(gh<_i224.MovieRepo>()),
    );
    gh.factory<_i565.GetHistoryMoviesUsecase>(
      () => _i565.GetHistoryMoviesUsecase(gh<_i763.UserRepository>()),
    );
    gh.singleton<_i71.FavoriteCubit>(
      () => _i71.FavoriteCubit(
        gh<_i444.AddFavoriteMovieUsecase>(),
        gh<_i708.RemoveFavoriteMovieUsecase>(),
        gh<_i313.GetFavoriteMoviesUsecase>(),
        gh<_i1002.NewMapper>(),
      ),
    );
    gh.factory<_i204.MovieDetailsCubit>(
      () => _i204.MovieDetailsCubit(
        gh<_i397.GetMovieDetailsUsecase>(),
        gh<_i875.GetSimilarMoviesUsecase>(),
      ),
    );
    gh.singleton<_i887.HistoryCubit>(
      () => _i887.HistoryCubit(
        gh<_i731.AddMovieToHistoryUsecase>(),
        gh<_i565.GetHistoryMoviesUsecase>(),
      ),
    );
    gh.factory<_i630.MovieCubit>(
      () => _i630.MovieCubit(
        gh<_i502.GetMoviesUseCase>(),
        gh<_i367.GetMoviesUseCaseByGenre>(),
      ),
    );
    gh.factory<_i547.HomeCubit>(
      () => _i547.HomeCubit(
        gh<_i502.GetMoviesUseCase>(),
        gh<_i367.GetMoviesUseCaseByGenre>(),
      ),
    );
    gh.factory<_i909.SearchCubit>(
      () => _i909.SearchCubit(gh<_i169.SearchMovieUsecase>()),
    );
    return this;
  }
}

class _$GetItModule extends _i1015.GetItModule {}
