import 'package:flutter/material.dart';
import 'package:freezed_example/app/app.dart';
import 'package:freezed_example/app/dependencies/register_global_dependencies.dart';

void main() {
  registerGlobalDependencies();
  runApp(
    const App(),
  );
}
