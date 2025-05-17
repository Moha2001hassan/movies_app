import 'package:dio/dio.dart';

import '../constants/keys.dart';

class DioClient { // I will use this later for Dependency Injection (DI) //
  static Dio create() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3',
        headers: {
          'Authorization': 'Bearer ${MyKeys.tmdbApiKey}',
          'accept': 'application/json',
        },
      ),
    );
  }
}
