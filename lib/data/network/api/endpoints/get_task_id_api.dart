import 'package:dio/dio.dart';
import 'package:test_bap/data/network/api/api_client.dart';

class GetTasksIdApi {
  GetTasksIdApi({required this.apiClient});

  final ApiClient apiClient;

  Future<Response> getTaskId(String taskId) async {
    try {
      final response = await apiClient.get(taskId);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
