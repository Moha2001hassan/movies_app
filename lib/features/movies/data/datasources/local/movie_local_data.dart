import '../../models/movie_model.dart';

abstract class MovieLocalDataSource {
  Future<void> cachePopularMovies(List<MovieModel> movies);
  Future<List<MovieModel>> getCachedPopularMovies();

  Future<void> cacheTopRatedMovies(List<MovieModel> movies);
  Future<List<MovieModel>> getCachedTopRatedMovies();

  Future<void> cacheUpcomingMovies(List<MovieModel> movies);
  Future<List<MovieModel>> getCachedUpcomingMovies();
}


