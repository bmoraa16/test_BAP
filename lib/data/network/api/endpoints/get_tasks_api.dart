import 'package:dio/dio.dart';
import 'package:test_bap/data/network/api/api_client.dart';

class GetTasksApi {
  GetTasksApi({required this.apiClient});

  final ApiClient apiClient;

  Future<Response> getTasks() async {
    try {
      final response = await apiClient.get('');
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
