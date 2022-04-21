import 'package:dio/dio.dart';
import 'package:freezed_example/app/constants.dart';
import 'package:get_it/get_it.dart';

/// [registerGlobalDependencies] Setup all needed dependencies.
void registerGlobalDependencies() {
  final _dio = Dio(
    BaseOptions(
      connectTimeout: 10000,
      baseUrl: baseUrl,
    ),
  )..interceptors.add(LogInterceptor());

  GetIt.instance.registerSingleton<Dio>(_dio);
}
