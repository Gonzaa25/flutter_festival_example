import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_example/home/cubit/data_cubit.dart';
import 'package:freezed_example/main.dart';

/// HomeBody
class HomeBody extends StatelessWidget {
  /// HomeBody
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: BlocBuilder<DataCubit, DataState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(
              child: Text('Nothing to show.'),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            loaded: (data) => data != null
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${data.title}',
                          style: const TextStyle(fontSize: 25),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '${data.subtitle} '
                          'running in "${dio.options.baseUrl}"',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                : const Center(
                    child: Text('No data found.'),
                  ),
            error: (Object error) => Center(
              child: Text(
                error.toString(),
              ),
            ),
          );
        },
      ),
    );
  }
}
