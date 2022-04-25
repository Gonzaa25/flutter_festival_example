import 'package:flutter/material.dart';
import 'package:freezed_example/home/screens/home_screen.dart';

/// App widget.
class App extends StatelessWidget {
  /// App widget.
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
