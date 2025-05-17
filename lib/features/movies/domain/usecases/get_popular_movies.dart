import '../../data/models/movie_model.dart';
import '../repositories/movie_repository.dart';

class GetPopularMovies {
  final MovieRepository repository;

  GetPopularMovies(this.repository);

  Future<List<MovieModel>> call() {
    return repository.getPopularMovies();
  }
}
