import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_example/home/cubit/data_cubit.dart';
import 'package:freezed_example/home/widgets/data_content.dart';

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
                ? DataContent(
                    data: data,
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
