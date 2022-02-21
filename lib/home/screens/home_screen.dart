import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_example/home/cubit/data_cubit.dart';
import 'package:freezed_example/home/widgets/home_body.dart';

/// HomePage screen.
class HomePage extends StatelessWidget {
  /// HomePage screen.
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example app'),
      ),
      body: const HomeBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<DataCubit>().getData(),
        child: const Icon(Icons.download),
      ),
    );
  }
}
