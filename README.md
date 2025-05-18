# Movies_App 🎬
This is a simple Flutter App show list if movies from TMDB website 

## Features Used
  - ✅ Clean Architecture
  - ✅ Cubit  --> ( As a state management )
  - ✅ Dio  --> ( For fetching data from API )
  - ✅ Dependency Injection  --> ( get_it )
  - ✅ Network Connectivity  --> ( connectivity_plus )
  - Cache Data  --> ( Hive )





## 📁 Project Structure
<pre lang="markdown"><code>
lib/
├── core/
│   ├── constants/
│   │   └── keys.dart              
│   ├── di/
│   │   └── service_locator.dart     
│   └── network/
│       └── dio_client.dart          
│
├── features/
│   └── movies/
│       ├── data/
│       │   ├── models/
│       │   │   └── movie_model.dart               
│       │   ├── datasources/
│       │   │   └── movie_remote_datasource.dart  
│       │   └── repositories/
│       │       └── movie_repository_impl.dart     
│       │
│       ├── domain/
│       │   ├── entities/
│       │   │   └── movie.dart                   
│       │   ├── repositories/
│       │   │   └── movie_repository.dart         
│       │   └── usecases/
│       │       ├── get_popular_movies.dart
│       │       ├── get_top_rated_movies.dart
│       │       └── get_upcoming_movies.dart
│       │
│       └── presentation/
│           ├── cubit/
│           │   ├── movie_cubit.dart               
│           │   └── movie_state.dart
│           ├── screens/
│           │   └── movies_screen.dart               
│           └── widgets/
│               └── movie_card.dart                
│
└── main.dart </code></pre>    

![Data Flow](https://github.com/user-attachments/assets/fde7c715-9abd-4928-8150-349d0523b998)
