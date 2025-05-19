import 'package:hive_flutter/hive_flutter.dart';

import '../../models/movie_model.dart';

part 'movie_hive_model.g.dart';

@HiveType(typeId: 1)
class MovieHiveModel extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String posterPath;
  @HiveField(3)
  final String releaseDate;
  @HiveField(4)
  final String overview;

  MovieHiveModel({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.releaseDate,
    required this.overview,
  });

  // For converting from API model
  factory MovieHiveModel.fromModel(MovieModel model) {
    return MovieHiveModel(
      id: model.id,
      title: model.title,
      posterPath: model.posterPath,
      releaseDate: model.releaseDate,
      overview: model.overview,
    );
  }

  // For converting back to model
  MovieModel toModel() {
    return MovieModel(
      id: id,
      title: title,
      posterPath: posterPath,
      releaseDate: releaseDate,
      overview: overview,
    );
  }
}
// flutter pub run build_runner build
