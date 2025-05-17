import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/datasources/movie_remote_data.dart';
import '../../data/repositories/movie_repo_impl.dart';
import '../../domain/usecases/get_popular_movies.dart';
import '../cubit/movie_cubit.dart';
import '../cubit/movie_state.dart';
import '../widgets/movie_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final movieRepo = MovieRepositoryImpl(MovieRemoteDataSource(Dio()));
        return MovieCubit(GetPopularMovies(movieRepo))..fetchMovies();
      },
      child: Scaffold(
        body: BlocBuilder<MovieCubit, MovieState>(
          builder: (context, state) {
            if (state is MovieLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MovieLoaded) {
              return ListView.builder(
                itemCount: state.movies.length,
                itemBuilder: (_, i) => MovieCard(movie: state.movies[i]),
              );
            } else {
              return const Center(child: Text('Something went wrong'));
            }
          },
        ),
      ),
    );
  }
}
