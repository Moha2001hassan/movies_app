import 'package:dio/dio.dart';

import '../constants/keys.dart';

// I will use this later for Dependency Injection (DI) //
class DioClient {
  static Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
        headers: {
          'Authorization': 'Bearer ${MyKeys.tmdbApiKey}',
          'accept': 'application/json',
        },
      ),
    );

    // Add interceptors
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: false,
        responseHeader: false,
      ),
    );

    return dio;
  }
}
