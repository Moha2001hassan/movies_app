import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/di/service_locator.dart';
import 'features/movies/data/datasources/local/movie_hive_model.dart';
import 'features/movies/presentation/screens/movies_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(MovieHiveModelAdapter());

  await Hive.openBox<MovieHiveModel>('popular_movies');
  await Hive.openBox<MovieHiveModel>('top_rated_movies');
  await Hive.openBox<MovieHiveModel>('upcoming_movies');

  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MoviesScreen(),
    );
  }
}
