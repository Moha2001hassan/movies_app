import 'package:hive_flutter/hive_flutter.dart';

import '../../models/movie_model.dart';
import 'movie_hive_model.dart';
import 'movie_local_data.dart';

class MovieLocalDataSourceImpl implements MovieLocalDataSource {
  final Box<MovieHiveModel> popularBox;
  final Box<MovieHiveModel> topRatedBox;
  final Box<MovieHiveModel> upcomingBox;

  MovieLocalDataSourceImpl({
    required this.popularBox,
    required this.topRatedBox,
    required this.upcomingBox,
  });

  @override
  Future<void> cachePopularMovies(List<MovieModel> movies) async {
    await popularBox.clear(); // Replace old cache
    for (var movie in movies) {
      await popularBox.put(movie.id, MovieHiveModel.fromModel(movie));
    }
  }

  @override
  Future<List<MovieModel>> getCachedPopularMovies() async {
    return popularBox.values.map((e) => e.toModel()).toList();
  }

  @override
  Future<void> cacheTopRatedMovies(List<MovieModel> movies) async {
    await topRatedBox.clear(); // Replace old cache
    for (var movie in movies) {
      await topRatedBox.put(movie.id, MovieHiveModel.fromModel(movie));
    }
  }

  @override
  Future<List<MovieModel>> getCachedTopRatedMovies() async {
    return topRatedBox.values.map((e) => e.toModel()).toList();
  }

  @override
  Future<void> cacheUpcomingMovies(List<MovieModel> movies) async {
    await upcomingBox.clear(); // Replace old cache
    for (var movie in movies) {
      await upcomingBox.put(movie.id, MovieHiveModel.fromModel(movie));
    }
  }

  @override
  Future<List<MovieModel>> getCachedUpcomingMovies() async {
    return upcomingBox.values.map((e) => e.toModel()).toList();
  }
}
