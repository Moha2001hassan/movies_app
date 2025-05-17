import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/datasources/movie_remote_data.dart';
import '../../data/repositories/movie_repo_impl.dart';
import '../../domain/usecases/get_popular_movies.dart';
import '../../domain/usecases/get_toprated_movies.dart';
import '../../domain/usecases/get_upcoming_movies.dart';
import '../cubit/movie_cubit.dart';
import '../cubit/movie_state.dart';
import '../widgets/movie_card.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  int _selectedIndex = 0;

  late final MovieCubit _movieCubit;

  @override
  void initState() {
    super.initState();
    final movieRepo = MovieRepositoryImpl(MovieRemoteDataSource(Dio()));
    _movieCubit = MovieCubit(
      GetPopularMovies(movieRepo),
      GetTopRatedMovies(movieRepo),
      GetUpcomingMovies(movieRepo),
    );
    _fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _movieCubit,
      child: Scaffold(
        backgroundColor: Colors.white24,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: BlocBuilder<MovieCubit, MovieState>(
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
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          child: BottomNavigationBar(
            selectedItemColor: Colors.red,
            currentIndex: _selectedIndex,
            onTap: _onTabTapped,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: 'Popular',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.thumb_up),
                label: 'Top Rated',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.upcoming),
                label: 'Upcoming',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _fetchMovies() {
    switch (_selectedIndex) {
      case 0:
        _movieCubit.fetchPopularMovies();
        break;
      case 1:
        _movieCubit.fetchTopRatedMovies();
        break;
      case 2:
        _movieCubit.fetchUpcomingMovies();
        break;
    }
  }

  void _onTabTapped(int index) {
    if (index != _selectedIndex) {
      setState(() => _selectedIndex = index);
      _fetchMovies();
    }
  }

  @override
  void dispose() {
    _movieCubit.close();
    super.dispose();
  }
}

