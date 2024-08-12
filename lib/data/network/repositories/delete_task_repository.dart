import 'package:dio/dio.dart';
import 'package:test_bap/data/network/api/api_error.dart';
import 'package:test_bap/data/network/api/endpoints/delete_task_id_api.dart';
import 'package:test_bap/data/network/dtos/dto_delete_task_resp.dart';
import 'package:test_bap/models/delete_task_resp.dart';

class DeleteTaskRepository {
  DeleteTaskRepository(this.tasksApi);

  final DeleteTaskIdApi tasksApi;

  Future<DeleteTaskResp> getTasks(
    Map<String, dynamic> dataP,
    int taskId,
  ) async {
    try {
      final response = await tasksApi.deleteTaskId(dataP, taskId);
      final data = response.data as Map<String, dynamic>;

      final taskData = DtoDeleteTaskResp.fromJson(data);
      final task = DeleteTaskResp(
        detail: taskData.detail,
      );
      return task;
    } on DioException catch (e) {
      final message = ApiError.fromDioError(e).toString();
      throw message;
    }
  }
}
