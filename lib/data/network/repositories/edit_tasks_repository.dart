import 'package:dio/dio.dart';
import 'package:test_bap/data/network/api/api_error.dart';
import 'package:test_bap/data/network/api/endpoints/put_task_id_api.dart';
import 'package:test_bap/data/network/dtos/dto_new_task_resp.dart';
import 'package:test_bap/models/new_task_resp.dart';

class EditTasksRepository {
  EditTasksRepository(this.tasksApi);

  final PutTaskIdApi tasksApi;

  Future<NewTaskResp> putTask(
    Map<String, dynamic> dataP,
    int taskId,
  ) async {
    try {
      final response = await tasksApi.putTaskId(
        dataP,
        taskId,
      );
      final data = response.data as Map<String, dynamic>;

      final taskData = DtoNewTaskResp.fromJson(data);
      final task = NewTaskResp(
        detail: taskData.detail,
        task: taskData.task,
      );
      return task;
    } on DioException catch (e) {
      final message = ApiError.fromDioError(e).toString();
      throw message;
    }
  }
}
