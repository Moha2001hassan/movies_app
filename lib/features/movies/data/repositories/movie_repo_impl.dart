import '../../domain/repositories/movie_repository.dart';
import '../datasources/movie_remote_data.dart';
import '../models/movie_model.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<MovieModel>> getPopularMovies() {
    return remoteDataSource.fetchPopularMovies();
  }
}
