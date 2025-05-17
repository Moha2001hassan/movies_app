import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_popular_movies.dart';
import 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final GetPopularMovies getPopularMovies;

  MovieCubit(this.getPopularMovies) : super(MovieInitial());

  Future<void> fetchMovies() async {
    emit(MovieLoading());
    final movies = await getPopularMovies();
    emit(MovieLoaded(movies));
  }
}
