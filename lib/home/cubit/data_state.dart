part of 'data_cubit.dart';

@freezed

/// Data cubit state.
class DataState with _$DataState {
  /// Initial state.
  const factory DataState.initial() = _Initial;

  /// Loading state.
  const factory DataState.loading() = _Loading;

  /// Loaded state.
  const factory DataState.loaded({required Data? data}) = _Loaded;

  /// Error state.
  const factory DataState.error({required Object error}) = _Error;
}
