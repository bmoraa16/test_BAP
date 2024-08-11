import 'package:dio/dio.dart';
import 'package:test_bap/data/network/api/api_client.dart';

class PutTaskIdApi {
  PutTaskIdApi({required this.apiClient});

  final ApiClient apiClient;

  Future<Response> putTaskId(String taskId) async {
    try {
      final response = await apiClient.post(taskId);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
