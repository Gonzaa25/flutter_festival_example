import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freezed_example/app/models/data/data.dart';
import 'package:freezed_example/services/backend_service.dart';

part 'data_cubit.freezed.dart';
part 'data_state.dart';

/// This cubit gets all the data from the backend service.
class DataCubit extends Cubit<DataState> {
  /// This cubit gets all the data from the backend service.
  DataCubit(this._service) : super(const DataState.initial());
  final BackendService _service;

  /// Fetch all the data and send the response in a loaded state.
  Future getData() async {
    if (state is _Loaded) return;
    emit(const DataState.loading());
    try {
      final data = await _service.getInfo();
      emit(DataState.loaded(data: data));
    } catch (error) {
      emit(DataState.error(error: error));
    }
  }

  /// Throws an Exception
  Future getException() async {
    if (state is _Loaded) return;
    emit(const DataState.loading());
    try {
      throw Exception('An error has ocurred.');
    } catch (error) {
      emit(DataState.error(error: error));
    }
  }
}
