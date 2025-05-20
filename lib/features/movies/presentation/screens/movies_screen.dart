import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/service_locator.dart';
import '../cubit/movie_cubit.dart';
import '../cubit/movie_state.dart';
import '../widgets/movie_card.dart';
import '../widgets/network_connection_bar.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  int _selectedIndex = 0;
  late final StreamSubscription<List<ConnectivityResult>>
      _connectivitySubscription;
  bool _hasConnection = true;

  @override
  void initState() {
    super.initState();
    _initConnectivityListener();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieCubit>(
      create: (_) => sl<MovieCubit>()..fetchPopularMovies(),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: Colors.white24,
          body: SafeArea(
            child: Column(
              children: [
                if (!_hasConnection) const NoConnectionBanner(),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    child: BlocBuilder<MovieCubit, MovieState>(
                      builder: (context, state) {
                        if (state is MovieLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is MovieLoaded) {
                          return RefreshIndicator(
                            onRefresh: () => _fetchMovies(context),
                            child: ListView.builder(
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemCount: state.movies.length,
                              itemBuilder: (_, i) =>
                                  MovieCard(movie: state.movies[i]),
                            ),
                          );
                        } else {
                          return const Center(
                              child: Text('Something went wrong'));
                        }
                      },
                    ),
                  ),
                ),
              ],
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
              onTap: (i) => _onTabTapped(i, context),
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
        );
      }),
    );
  }

  void _initConnectivityListener() {
    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen((results) {
      final hasConnection =
          results.any((result) => result != ConnectivityResult.none);
      if (hasConnection != _hasConnection) {
        setState(() {
          _hasConnection = hasConnection;
        });
      }
    });
  }

  Future<void> _fetchMovies(BuildContext context) async {
    final cubit = context.read<MovieCubit>();
    switch (_selectedIndex) {
      case 0:
        await cubit.fetchPopularMovies();
        break;
      case 1:
        await cubit.fetchTopRatedMovies();
        break;
      case 2:
        await cubit.fetchUpcomingMovies();
        break;
    }
  }


  void _onTabTapped(int index, BuildContext context) {
    if (index != _selectedIndex) {
      setState(() => _selectedIndex = index);
      _fetchMovies(context);
    }
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }
}
