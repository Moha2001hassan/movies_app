import 'package:dio/dio.dart';

import '../../../../core/constants/keys.dart';
import '../models/movie_model.dart';

class MovieRemoteDataSource {
  final Dio dio;

  MovieRemoteDataSource(this.dio);

  Future<List<MovieModel>> fetchPopularMovies() async {
    final response = await dio.get(
      'https://api.themoviedb.org/3/movie/popular',
      options: Options(
        headers: {
          'Authorization': 'Bearer ${MyKeys.tmdbApiKey}',
          'accept': 'application/json',
        },
      ),
    );

    final List results = response.data['results'];
    return results.map((json) => MovieModel.fromJson(json)).toList();
  }

  Future<List<MovieModel>> fetchTopRatedMovies() async {
    final response = await dio.get(
      'https://api.themoviedb.org/3/movie/top_rated',
      options: Options(
        headers: {
          'Authorization': 'Bearer ${MyKeys.tmdbApiKey}',
          'accept': 'application/json',
        },
      ),
    );

    final List results = response.data['results'];
    return results.map((json) => MovieModel.fromJson(json)).toList();
  }

  Future<List<MovieModel>> fetchUpcomingMovies() async {
    final response = await dio.get(
      'https://api.themoviedb.org/3/movie/upcoming',
      options: Options(
        headers: {
          'Authorization': 'Bearer ${MyKeys.tmdbApiKey}',
          'accept': 'application/json',
        },
      ),
    );

    final List results = response.data['results'];
    return results.map((json) => MovieModel.fromJson(json)).toList();
  }
}
