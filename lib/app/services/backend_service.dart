import 'package:dio/dio.dart';
import 'package:freezed_example/app/constants.dart';
import 'package:freezed_example/app/models/data.dart';

/// This is the backend service.
class BackendService {
  /// This is the backend service.
  BackendService(this.dio);

  /// dio instance.
  final Dio dio;

  /// Fetch data from the backend.
  Future<Data?> getInfo() async {
    final response = await dio.get<Map<String, dynamic>>(
      infoPath,
      options: Options(
        responseType: ResponseType.json,
      ),
    );
    final data = response.data;
    if (response.statusCode == 200 && data != null) {
      return Data.fromJson(data);
    }
    return null;
  }
}
