# news_offline

lib/
├── core/
│   ├── constants/
│   ├── utils/
│   └── network/          <- Dio setup
├── features/
│   └── movies/
│       ├── data/
│       │   ├── models/
│       │   │   └── movie_model.dart
│       │   ├── datasources/
│       │   │   └── movie_remote_datasource.dart
│       │   └── repositories/
│       │       └── movie_repository_impl.dart
│       ├── domain/
│       │   ├── entities/
│       │   │   └── movie.dart
│       │   ├── repositories/
│       │   │   └── movie_repository.dart
│       │   └── usecases/
│       │       └── get_popular_movies.dart
│       ├── presentation/
│       │   ├── cubit/
│       │   │   └── movie_cubit.dart
│       │   ├── screens/
│       │   │   └── home_screen.dart
│       │   └── widgets/
│       │       └── movie_card.dart
├── main.dart
