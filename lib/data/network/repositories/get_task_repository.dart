import 'package:dio/dio.dart';
import 'package:test_bap/data/network/api/api_error.dart';
import 'package:test_bap/data/network/api/endpoints/get_task_id_api.dart';
import 'package:test_bap/data/network/dtos/dto_task.dart';
import 'package:test_bap/models/task.dart';

class TaskRepository {
  TaskRepository(this.tasksApi);

  final GetTaskIdApi tasksApi;

  Future<List<Task>> getTasks(
    Map<String, dynamic> dataP,
    int taskId,
  ) async {
    try {
      final response = await tasksApi.getTaskId(dataP, taskId);
      final data = response.data as List<dynamic>;

      final tasks = data.map((task) {
        final taskData = DtoTask.fromJson(task as Map<String, dynamic>);
        return Task(
          id: taskData.id,
          title: taskData.title,
          isCompleted: taskData.isCompleted,
          dueDate: taskData.dueDate,
          comments: taskData.comments,
          description: taskData.description,
          tags: taskData.tags,
          token: taskData.token,
          createdAt: taskData.createdAt,
          updatedAt: taskData.updatedAt,
        );
      }).toList();

      return tasks;
    } on DioException catch (e) {
      final message = ApiError.fromDioError(e).toString();
      throw message;
    }
  }
}
