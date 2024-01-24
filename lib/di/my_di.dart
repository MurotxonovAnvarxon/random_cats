import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:random_cats/data/remote/api_client.dart';

final getIt = GetIt.instance;

final dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
    contentType: 'application/json',
    receiveDataWhenStatusError: true));

void setUp() {
  getIt.registerSingleton<ApiClient>(ApiClient(dio));
}
