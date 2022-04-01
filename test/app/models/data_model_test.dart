import 'package:flutter_test/flutter_test.dart';
import 'package:freezed_example/app/models/data.dart';

void main() {
  final data = Data(title: 'title', subtitle: 'subtitle');
  group('DataModel', () {
    test('Equality', () {
      expect(data, Data(title: 'title', subtitle: 'subtitle'));
    });
    test('copyWith', () {
      expect(data.copyWith(), data);
    });

    test('toString', () {
      expect(data.toString(), isA<String>());
    });
    test('toJson', () {
      expect(data.toJson(), isA<Map<String, dynamic>>());
    });

    test('fromJson', () {
      expect(Data.fromJson(data.toJson()), isA<Data>());
    });
  });
}
