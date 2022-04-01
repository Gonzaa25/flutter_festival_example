import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_example/home/constants/home_ui_constants.dart';
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
            initial: () => Center(
              child: Text(
                HomeUiConstants.nothingToShow,
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            loaded: (data) {
              if (data == null) {
                return Center(
                  child: Text(
                    HomeUiConstants.noDataFound,
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                );
              }
              return DataContent(
                data: data,
              );
            },
            error: (Object error) => Center(
              child: Text(
                error is DioError ? error.message : error.toString(),
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}
