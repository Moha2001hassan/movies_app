import '../../data/models/movie_model.dart';
import '../repositories/movie_repository.dart';

class GetTopRatedMovies {
  final MovieRepository repository;

  GetTopRatedMovies(this.repository);

  Future<List<MovieModel>> call() {
    return repository.getTopRatedMovies();
  }
}
