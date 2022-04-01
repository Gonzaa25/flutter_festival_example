import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freezed_example/app/models/data.dart';
import 'package:freezed_example/app/services/backend_service.dart';
import 'package:freezed_example/home/cubit/data_cubit.dart';
import 'package:freezed_example/home/screens/home_screen.dart';
import 'package:freezed_example/home/widgets/data_content.dart';
import 'package:freezed_example/home/widgets/home_body.dart';
import 'package:mocktail/mocktail.dart';

class MockBackendService extends Mock implements BackendService {}

class MockDio extends Mock implements Dio {}

void main() {
  late BackendService backendService;
  late DataCubit dataCubit;
  late Widget homeScreen;

  setUp(() {
    backendService = MockBackendService();
    dataCubit = DataCubit(backendService);
    homeScreen = MaterialApp(
      home: BlocProvider(
        create: (context) => dataCubit,
        child: const HomePage(),
      ),
    );

    when(
      backendService,
    ).calls(const Symbol('getInfo')).thenAnswer(
          (p0) => Future.value(
            Data(
              title: 'title',
              subtitle: 'subtitle',
            ),
          ),
        );
  });

  testWidgets('should show a HomeBody', (tester) async {
    await tester.pumpWidget(homeScreen);
    expect(find.byType(HomeBody), findsOneWidget);
  });

  testWidgets('should show a DataContent', (tester) async {
    await tester.pumpWidget(homeScreen);
    final button = find.byIcon(Icons.download);
    await tester.tap(button);
    await tester.pumpAndSettle();
    expect(find.byType(DataContent), findsWidgets);
  });
}
