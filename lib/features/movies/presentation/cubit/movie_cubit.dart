import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_popular_movies.dart';
import '../../domain/usecases/get_toprated_movies.dart';
import '../../domain/usecases/get_upcoming_movies.dart';
import 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final GetPopularMovies getPopularMovies;
  final GetTopRatedMovies getTopRatedMovies;
  final GetUpcomingMovies getUpcomingMovies;

  MovieCubit(
    this.getPopularMovies,
    this.getTopRatedMovies,
    this.getUpcomingMovies,
  ) : super(MovieInitial());

  Future<void> fetchPopularMovies() async {
    emit(MovieLoading());
    final movies = await getPopularMovies();
    emit(MovieLoaded(movies));
  }

  Future<void> fetchTopRatedMovies() async {
    emit(MovieLoading());
    final movies = await getTopRatedMovies();
    emit(MovieLoaded(movies));
  }

  Future<void> fetchUpcomingMovies() async {
    emit(MovieLoading());
    final movies = await getUpcomingMovies();
    emit(MovieLoaded(movies));
  }
}
