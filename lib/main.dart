import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:freezed_example/app/app.dart';

/// dio instance.
final dio = Dio(
  BaseOptions(
    baseUrl: 'http://10.0.2.2:5500/',
  ),
);
void main() {
  /// Log all calls.
  dio.interceptors.add(LogInterceptor());
  runApp(
    const App(),
  );
}
