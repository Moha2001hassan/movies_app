import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import '../../features/movies/data/datasources/movie_remote_data.dart';
import '../../features/movies/data/repositories/movie_repo_impl.dart';
import '../../features/movies/domain/repositories/movie_repository.dart';
import '../../features/movies/domain/usecases/get_popular_movies.dart';
import '../../features/movies/domain/usecases/get_toprated_movies.dart';
import '../../features/movies/domain/usecases/get_upcoming_movies.dart';
import '../../features/movies/presentation/cubit/movie_cubit.dart';
import '../network/dio_client.dart';

final sl = GetIt.instance;

void setupLocator() {
  // Core
  sl.registerLazySingleton<Dio>(() => DioClient.createDio());

  // Data Sources
  sl.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSource(sl<Dio>()));

  // Repository- Register as interface!
  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(sl<MovieRemoteDataSource>()));

  // Use Cases
  sl.registerLazySingleton(() => GetPopularMovies(sl()));
  sl.registerLazySingleton(() => GetTopRatedMovies(sl()));
  sl.registerLazySingleton(() => GetUpcomingMovies(sl()));

  // Cubit
  sl.registerFactory(
    () => MovieCubit(
      sl<GetPopularMovies>(),
      sl<GetTopRatedMovies>(),
      sl<GetUpcomingMovies>(),
    ),
  );
}
