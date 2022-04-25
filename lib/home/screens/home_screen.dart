import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_example/app/services/backend_service.dart';
import 'package:freezed_example/home/constants/home_ui_constants.dart';
import 'package:freezed_example/home/cubit/data_cubit.dart';
import 'package:freezed_example/home/widgets/home_body.dart';
import 'package:get_it/get_it.dart';

/// HomePage screen.
class HomePage extends StatelessWidget {
  /// HomePage screen.
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataCubit(
        BackendService(
          GetIt.instance.get<Dio>(),
        ),
      ),
      child: const HomeView(),
    );
  }
}

/// Home view screen.
class HomeView extends StatelessWidget {
  /// Home view screen.
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(HomeUiConstants.appName),
      ),
      body: const HomeBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<DataCubit>().getData(),
        child: const Icon(Icons.download),
      ),
    );
  }
}
