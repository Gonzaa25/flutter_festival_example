import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_example/app/services/backend_service.dart';
import 'package:freezed_example/home/cubit/data_cubit.dart';
import 'package:freezed_example/home/screens/home_screen.dart';
import 'package:freezed_example/main.dart' show dio;

/// App widget.
class App extends StatelessWidget {
  /// App widget.
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
