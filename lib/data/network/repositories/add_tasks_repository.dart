import 'package:dio/dio.dart';
import 'package:test_bap/data/network/api/api_error.dart';
import 'package:test_bap/data/network/api/endpoints/post_tasks_api.dart';
import 'package:test_bap/data/network/dtos/dto_new_task_resp.dart';
import 'package:test_bap/models/new_task_resp.dart';

class AddTasksRepository {
  AddTasksRepository(this.tasksApi);

  final PostTasksApi tasksApi;

  Future<NewTaskResp> postTask(Map<String, dynamic> dataP) async {
    try {
      final response = await tasksApi.postTasks(dataP);
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
