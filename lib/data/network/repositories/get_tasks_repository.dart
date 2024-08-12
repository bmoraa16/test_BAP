import 'package:dio/dio.dart';
import 'package:test_bap/data/network/api/api_error.dart';
import 'package:test_bap/data/network/api/endpoints/get_tasks_api.dart';
import 'package:test_bap/data/network/dtos/dto_tasks.dart';
import 'package:test_bap/models/tasks.dart';

class TasksRepository {
  TasksRepository(this.tasksApi);

  final GetTasksApi tasksApi;

  Future<List<Tasks>> getTasks(Map<String, dynamic> dataP) async {
    try {
      final response = await tasksApi.getTasks(dataP);
      final data = response.data as List<dynamic>;

      final tasks = data.map((task) {
        final taskData = DtoTasks.fromJson(task as Map<String, dynamic>);
        return Tasks(
          id: taskData.id,
          title: taskData.title,
          isCompleted: taskData.isCompleted,
          dueDate: taskData.dueDate,
        );
      }).toList();

      return tasks;
    } on DioException catch (e) {
      final message = ApiError.fromDioError(e).toString();
      throw message;
    }
  }
}
