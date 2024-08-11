import 'package:dio/dio.dart';
import 'package:test_bap/data/network/api/api_client.dart';

class PostTasksApi {
  PostTasksApi({required this.apiClient});

  final ApiClient apiClient;

  Future<Response> postTasks() async {
    try {
      final response = await apiClient.post('');
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
