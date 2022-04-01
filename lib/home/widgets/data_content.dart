import 'package:flutter/material.dart';
import 'package:freezed_example/app/models/data.dart';

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
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  fontSize: 25,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            '${data.subtitle}',
            style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
