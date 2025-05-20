# Movies_App 🎬
This is a simple Flutter App show list if movies from TMDB website 

## Features Used
  - ✅ Clean Architecture
  - ✅ Cubit  --> ( As a state management )
  - ✅ Dio  --> ( For fetching data from API )
  - ✅ Dependency Injection  --> ( get_it )
  - ✅ Network Connectivity  --> ( connectivity_plus )
  - ✅ Cache Data  --> ( Hive )
  - ✅ Cache Network Images  --> ( cached_network_image )


## 📱 Screenshots
<div>   
  <img src="https://github.com/user-attachments/assets/134073c9-8c05-4d0c-a469-3c8e55114693" alt="Screenshot" width="250">
  <img src="https://github.com/user-attachments/assets/350b611f-d206-411a-a349-3b8641afc09b" alt="Screenshot" width="250">
</div>



## 📁 Project Structure
<pre lang="markdown"><code>
lib/
├── core/
│   ├── constants/
│   │   └── keys.dart              
│   ├── di/
│   │   └── service_locator.dart     
│   ├── network/
│   │   └── dio_client.dart
│   └── shared_widgets/
│       └── custom_cached_img.dart
│
├── features/
│   └── movies/
│       ├── data/
│       │   ├── datasources/
│       │   │   ├── local/
│       │   │   │   ├── movie_hive_model.dart
│       │   │   │   ├── movie_hive_model.g.dart
│       │   │   │   ├── movie_local_data.dart
│       │   │   │   └── movie_local_data_impl.dart
│       │   │   └── remote/
│       │   │       └── movie_remote_data.dart
│       │   ├── models/
│       │   │   └── movie_model.dart
│       │   └── repositories/
│       │       └── movie_repo_impl.dart     
│       │
│       ├── domain/
│       │   ├── entities/
│       │   │   └── movie_entity.dart                   
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
│               ├── movie_card.dart
│               └── network_connection_bar.dart                
│
└── main.dart </code></pre>    

![Data Flow](https://github.com/user-attachments/assets/fde7c715-9abd-4928-8150-349d0523b998)
