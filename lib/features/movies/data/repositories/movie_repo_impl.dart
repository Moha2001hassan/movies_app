import '../../domain/repositories/movie_repository.dart';
import '../datasources/local/movie_local_data.dart';
import '../datasources/remote/movie_remote_data.dart';
import '../models/movie_model.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;
  final MovieLocalDataSource localDataSource;

  MovieRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    try {
      final remoteMovies = await remoteDataSource.fetchPopularMovies();
      await localDataSource.cachePopularMovies(remoteMovies); // Cache the data
      return remoteMovies;
    } catch (e) {
      // If API call fails, return cached data
      final cachedMovies = await localDataSource.getCachedPopularMovies();
      return cachedMovies;
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    try {
      final remoteMovies = await remoteDataSource.fetchTopRatedMovies();
      await localDataSource.cacheTopRatedMovies(remoteMovies); // Cache the data
      return remoteMovies;
    } catch (e) {
      // If API call fails, return cached data
      final cachedMovies = await localDataSource.getCachedTopRatedMovies();
      return cachedMovies;
    }
  }

  @override
  Future<List<MovieModel>> getUpcomingMovies() async {
    try {
      final remoteMovies = await remoteDataSource.fetchUpcomingMovies();
      await localDataSource.cacheUpcomingMovies(remoteMovies); // Cache the data
      return remoteMovies;
    } catch (e) {
      // If API call fails, return cached data
      final cachedMovies = await localDataSource.getCachedUpcomingMovies();
      return cachedMovies;
    }
  }
}
