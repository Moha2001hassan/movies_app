import 'package:dio/dio.dart';
import '../models/movie_model.dart';

class MovieRemoteDataSource {
  final Dio dio;

  MovieRemoteDataSource(this.dio);

  Future<List<MovieModel>> fetchPopularMovies() async {
    final response = await dio.get('/movie/popular');

    final List results = response.data['results'];
    return results.map((json) => MovieModel.fromJson(json)).toList();
  }

  Future<List<MovieModel>> fetchTopRatedMovies() async {
    final response = await dio.get('/movie/top_rated');

    final List results = response.data['results'];
    return results.map((json) => MovieModel.fromJson(json)).toList();
  }

  Future<List<MovieModel>> fetchUpcomingMovies() async {
    final response = await dio.get('/movie/upcoming');

    final List results = response.data['results'];
    return results.map((json) => MovieModel.fromJson(json)).toList();
  }
}
