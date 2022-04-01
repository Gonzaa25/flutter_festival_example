import 'package:freezed_annotation/freezed_annotation.dart';

part 'data.freezed.dart';
part 'data.g.dart';

@freezed

/// Custom data class.
class Data with _$Data {
  /// Custom data class.
  factory Data({
    String? title,
    String? subtitle,
  }) = _Data;

  /// fromJson.
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
