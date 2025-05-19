import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../features/movies/data/datasources/local/movie_hive_model.dart';
import '../../features/movies/data/datasources/local/movie_local_data.dart';
import '../../features/movies/data/datasources/local/movie_local_data_impl.dart';
import '../../features/movies/data/datasources/remote/movie_remote_data.dart';
import '../../features/movies/data/repositories/movie_repo_impl.dart';
import '../../features/movies/domain/repositories/movie_repository.dart';
import '../../features/movies/domain/usecases/get_popular_movies.dart';
import '../../features/movies/domain/usecases/get_toprated_movies.dart';
import '../../features/movies/domain/usecases/get_upcoming_movies.dart';
import '../../features/movies/presentation/cubit/movie_cubit.dart';
import '../network/dio_client.dart';

final sl = GetIt.instance;

void setupLocator() {
  // Dio
  sl.registerLazySingleton<Dio>(() => DioClient.createDio());

  // Remote Data Sources
  sl.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSource(sl<Dio>()));

  // Local Data Source - use the concrete implementation
  sl.registerLazySingleton<MovieLocalDataSource>(() => MovieLocalDataSourceImpl(
        popularBox: Hive.box<MovieHiveModel>('popular_movies'),
        topRatedBox: Hive.box<MovieHiveModel>('top_rated_movies'),
        upcomingBox: Hive.box<MovieHiveModel>('upcoming_movies'),
      ));

  // Repository- Register as interface!
  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(
        sl<MovieRemoteDataSource>(),
        sl<MovieLocalDataSource>(),
      ));

  // Use Cases
  sl.registerLazySingleton(() => GetPopularMovies(sl<MovieRepository>()));
  sl.registerLazySingleton(() => GetTopRatedMovies(sl<MovieRepository>()));
  sl.registerLazySingleton(() => GetUpcomingMovies(sl<MovieRepository>()));

  // MovieCubit
  sl.registerFactory(
    () => MovieCubit(
      sl<GetPopularMovies>(),
      sl<GetTopRatedMovies>(),
      sl<GetUpcomingMovies>(),
    ),
  );
}
