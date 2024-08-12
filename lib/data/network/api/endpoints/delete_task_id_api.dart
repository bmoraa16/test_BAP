import 'package:dio/dio.dart';
import 'package:test_bap/data/network/api/api_client.dart';

class DeleteTaskIdApi {
  DeleteTaskIdApi({required this.apiClient});

  final ApiClient apiClient;

  Future<Response> deleteTaskId(
    Map<String, dynamic> data,
    int taskId,
  ) async {
    try {
      final response = await apiClient.delete(
        'tasks/$taskId?',
        params: data,
        options: Options(
          headers: {
            'Authorization':
                // ignore: lines_longer_than_80_chars
                'Bearer e864a0c9eda63181d7d65bc73e61e3dc6b74ef9b82f7049f1fc7d9fc8f29706025bd271d1ee1822b15d654a84e1a0997b973a46f923cc9977b3fcbb064179ecd',
          },
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
