import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_example/app/constants.dart';
import 'package:freezed_example/app/services/backend_service.dart';
import 'package:freezed_example/home/cubit/data_cubit.dart';
import 'package:freezed_example/home/screens/home_screen.dart';

/// App widget.
class App extends StatelessWidget {
  /// App widget.
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// dio instance.
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrlForEmulator,
      ),
    );

    /// Log all calls.
    dio.interceptors.add(LogInterceptor());

    return MaterialApp(
      home: BlocProvider(
        create: (context) => DataCubit(
          BackendService(dio),
        ),
        child: const HomePage(),
      ),
    );
  }
}
