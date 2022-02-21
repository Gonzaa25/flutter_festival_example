import 'package:flutter/material.dart';
import 'package:freezed_example/app/constants.dart';
import 'package:freezed_example/app/models/data/data.dart';

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
    return Center(
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
            'running in "$baseUrl"',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
