import 'package:freezed_annotation/freezed_annotation.dart';

part 'data.freezed.dart';
part 'data.g.dart';

@freezed

/// Data model
class Data with _$Data {
  /// Data model with [title] and [subtitle]
  factory Data({
    required String title,
    required String subtitle,
  }) = _Data;

  /// fromJson method
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
