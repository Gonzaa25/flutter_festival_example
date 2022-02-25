import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:freezed_example/app/models/data/data.dart';
import 'package:get_it/get_it.dart';

/// Shows all the data.
class DataContent extends StatelessWidget {
  /// Shows all the data.
  const DataContent({
    Key? key,
    required this.data,
  }) : super(key: key);

  /// Data that comes from the backend.
  final Data data;
  @override
  Widget build(BuildContext context) {
    final dio = GetIt.instance.get<Dio>();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${data.title}',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  fontSize: 25,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            '${data.subtitle}'
            'running on ${dio.options.baseUrl}',
            style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
